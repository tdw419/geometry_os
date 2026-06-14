# startup and system stubs for GeOS Native Port

.section .text
.global _entry
_entry:
        # Set up a single stack
        la sp, stack0
        li a0, 4096 * 4       # Allocate 16KB stack space
        add sp, sp, a0
        # Jump directly to main() in main.c
        call main
spin:
        j spin

.global push_off
.global pop_off
.global intr_on
.global intr_off
push_off:
        ret
pop_off:
        ret
intr_on:
        ret
intr_off:
        ret

.global swtch
swtch:
        ret

# Declare stack0 here to avoid start.c dependency
.section .bss
.align 16
.global stack0
stack0:
        .space 4096 * 4       # 16KB stack
