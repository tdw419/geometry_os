.section .text
.global _start
_start:
    # write(1, msg, len)
    li a0, 1
    la a1, msg
    li a2, 37
    li a7, 64
    ecall

loop:
    j loop

.section .rodata
msg:
    .ascii "Hello from Native GeOS Linux Guest!\n\0"
