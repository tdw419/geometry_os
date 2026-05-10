; DESCRIPTION: Places a yellow 62x118 box at position (13, 22).
; PLAN: r0=13(x), r1=22(y), r2=62(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 22
LDI r2, 62
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
