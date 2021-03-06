$:.unshift File.expand_path("../../lib", __FILE__)
require 'rubygems'
require 'minitest/pride'
require 'minitest/autorun'

puts RUBY_DESCRIPTION

class MiniTest::Unit::TestCase

  def async_test(time=0.5)
    q = TimedQueue.new
    yield Proc.new { q << nil }
    q.timed_pop(time)
  end

end

$VERBOSE = 1

require 'connection_pool'
