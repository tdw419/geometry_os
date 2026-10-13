// Phase 99: BEEP Opcode Unit Test
// Tests BEEP (0x7C) opcode for queuing audio tones

// Initialize BEEP_QUEUE
lui x5, 0x0         // x5 = 0x3000
addi x5, x5, 0x3000

// Set head pointer = 0 at 0x3080
sw x0, 0x80(x5)

// Set tail pointer = 0 at 0x3084
sw x0, 0x84(x5)

// Test 1: Queue tone 440Hz, 500ms
lui x1, 0x0         // x1 = 440 (frequency)
addi x1, x1, 440
lui x2, 0x0         // x2 = 500 (duration)
addi x2, x2, 500
beep x1, x2         // BEEP (opcode 0x7C)

// Test 2: Queue tone 880Hz, 250ms
lui x1, 0x0         // x1 = 880
addi x1, x1, 880
lui x2, 0x0         // x2 = 250
addi x2, x2, 250
beep x1, x2         // BEEP (opcode 0x7C)

// Halt
ebreak

// Expected BEEP_QUEUE state:
// Entry 0 (0x3000): freq=440, dur=500
// Entry 1 (0x3008): freq=880, dur=250
// Head pointer (0x3080): 2
// Tail pointer (0x3084): 0
// Audio ready flag (0x3108): 1