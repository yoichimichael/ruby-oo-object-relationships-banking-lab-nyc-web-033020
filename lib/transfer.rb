class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    
    if @status == "complete" # || !@receiver.valid?
      "Transaction rejected."

    elsif @sender.balance < @amount || @receiver.status == "closed" 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end

  end
      
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end