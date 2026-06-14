    .section .text.entry
    .globl _start
_start:
    /* Set up stack pointer from STACK_TOP symbol (set via --defsym in linker) */
    .option push
    .option norelax
    la      sp, STACK_TOP
    .option pop
    /* Clear BSS */
    la      t0, __bss_start
    la      t1, __bss_end
1:
    bge     t0, t1, 2f
    sw      zero, 0(t0)
    addi    t0, t0, 4
    j       1b
2:
    jal     ra, c_start
    li      a7, 8
    ecall
