// Minimal ECALL test for debug counters
// Simple ECALL with syscall 291

.section .text
.global _start

_start:
    lui     a7, 0x00000  // Load high bits for syscall number
    addi    a7, a7, 291  // syscall number 291 in a7
    ecall               // Execute ECALL instruction
    addi    zero, zero, 0 // NOP
    j       _start       // Loop forever