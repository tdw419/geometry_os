# Minimal CRT for test_syscalls
.global main
.global _start
.global exit

# Simple entry point - just call main
_start:
    call main
    # If main returns, call exit with its return value
    mv a0, a0  # Return value from main
    # Exit syscall (SYS_exit = 93)
    li a7, 93
    ecall
    # If ecall returns, hang
    1: j 1b