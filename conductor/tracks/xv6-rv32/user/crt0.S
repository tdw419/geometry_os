# User-space startup code.
# The kernel's exec() returns with:
#   a0 = argc
#   a1 = sp (argv array on the stack)
# Just call main(argc, argv) — RISC-V calling convention
# already expects argc in a0 and argv in a1.

.text
.globl _start
_start:
    call main
    # main returned — call exit(main_return_value)
    li a7, 2           # SYS_exit
    ecall
loop:
    j loop
