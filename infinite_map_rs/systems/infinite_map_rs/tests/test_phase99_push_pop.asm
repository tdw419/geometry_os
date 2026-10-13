// Phase 99: Stack Operations Unit Tests
// Tests PUSH (0x7F) and POP (0x80) opcodes

// Initialize stack pointer
lui x30, 0x0        // x30 = 0xF000
addi x30, x30, 0xF000

// Test 1: PUSH x1 (value 100)
lui x1, 0x0         // x1 = 100
addi x1, x1, 100
push x1             // PUSH x1 (opcode 0x7F)

// Test 2: PUSH x2 (value 200)
lui x2, 0x0         // x2 = 200
addi x2, x2, 200
push x2             // PUSH x2 (opcode 0x7F)

// Test 3: POP to x3 (should get 200 - LIFO)
pop x3              // POP x3 (opcode 0x80)

// Test 4: POP to x4 (should get 100)
pop x4              // POP x4 (opcode 0x80)

// Test 5: POP to x0 (discard, should work)
pop x0              // POP x0 (should discard value)

// Halt
ebreak

// Expected final state:
// x30 = 0xF008 (stack pointer after 2 pops)
// x3 = 200 (popped last pushed value)
// x4 = 100 (popped first pushed value)