.section .text
.globl _start

_start:
    li a7, 64        # sys_write
    li a0, 1         # fd = stdout
    la a1, msg       # message buffer
    li a2, 13        # length
    ecall

    li a7, 93        # sys_exit
    li a0, 0         # status = 0
    ecall

.section .rodata
msg:
    .string "Hello, GeOS!\n"