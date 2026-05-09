; DESCRIPTION: Draws a yellow rectangle at (99, 89) with width 29 and height 32.
; PLAN: r0=99(x), r1=89(y), r2=29(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 89
LDI r2, 29
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
