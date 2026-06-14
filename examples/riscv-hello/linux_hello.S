# linux_hello.S
.section .text
.global _start
_start:
    # write(1, "Hello RISC-V Linux!\n", 20)
    li a7, 64      # sys_write (Linux RV32)
    li a0, 1       # fd = stdout
    la a1, msg     # buf
    li a2, 20      # count
    ecall

    # exit(0)
    li a7, 93      # sys_exit
    li a0, 0       # status
    ecall

.section .rodata
msg:
    .ascii "Hello RISC-V Linux!\n"
