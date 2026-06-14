    .section .text.entry
    .globl _start
_start:
    li      a7, 1      /* SBI_CONSOLE_PUTCHAR */
    li      a0, 0x42   /* 'B' */
    ecall
    li      t0, 100000
1:
    addi    t0, t0, -1
    bnez    t0, 1b
    j       _start
