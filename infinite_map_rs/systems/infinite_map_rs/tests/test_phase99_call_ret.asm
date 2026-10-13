// Phase 99: Subroutine Call Unit Tests
// Tests CALL (0x7D) and RET (0x7E) opcodes

// Initialize stack pointer
lui x30, 0x0        // x30 = 0xF000
addi x30, x30, 0xF000

// Test: Call a subroutine and return
lui x1, 0x0         // x1 = 0 (will be set by subroutine)
lui x2, 0x0         // x2 = 1 (argument to subroutine)
call x3             // CALL subroutine (opcode 0x7D, target in x3)

// Return lands here
// x1 should now be 100

// Halt
ebreak

// Subroutine
subroutine:
    // Set x1 = 100 (proof we were here)
    lui x1, 0x0
    addi x1, x1, 100

    // Return to caller
    ret             // RET (opcode 0x7E)

// Assembly data: x3 = address of subroutine
// PC values will be set by loader