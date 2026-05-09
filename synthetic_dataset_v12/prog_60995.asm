; DESCRIPTION: Places a black 101x23 rectangle at position (162, 147).
; PLAN: r0=162(x), r1=147(y), r2=101(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 147
LDI r2, 101
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
