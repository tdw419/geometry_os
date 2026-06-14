    .section .rodata
    .align 4
    .globl _guest_a_start, _guest_a_end, _guest_b_start, _guest_b_end
_guest_a_start:
    .incbin "guest_a.bin"
_guest_a_end:
_guest_b_start:
    .incbin "guest_b.bin"
_guest_b_end:
