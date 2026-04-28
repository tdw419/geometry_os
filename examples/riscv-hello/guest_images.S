    .section .rodata
    .align 4
    .globl _hello_a_start, _hello_a_end, _hello_b_start, _hello_b_end
_hello_a_start:
    .incbin "guest_a.bin"
_hello_a_end:
_hello_b_start:
    .incbin "guest_b.bin"
_hello_b_end:
