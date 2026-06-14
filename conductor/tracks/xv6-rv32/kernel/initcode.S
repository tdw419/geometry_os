# Initial process that execs /init.
# This code runs in user space.
# Must be compiled as position-independent RV32 code.
#
# exec(init, argv)

# System call numbers (from syscall.h)
.equ SYS_exec, 7
.equ SYS_exit, 2

.text
.globl start
start:
    la a0, init         # path = "/init"
    la a1, argv         # argv = {"/init", 0}
    li a7, SYS_exec
    ecall

    # exec failed — exit with status 1
    li a0, 1
    li a7, SYS_exit
    ecall

    # shouldn't reach here, but loop just in case
1:  j 1b

.section .rodata
init:
    .string "/init"

.align 4
argv:
    .word init
    .word 0
