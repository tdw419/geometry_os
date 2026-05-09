; DESCRIPTION: Places a black 27x86 rectangle at position (222, 147).
; PLAN: r0=222(x), r1=147(y), r2=27(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 147
LDI r2, 27
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
