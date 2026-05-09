; DESCRIPTION: Draws a black rectangle at (68, 144) with width 119 and height 99.
; PLAN: r0=68(x), r1=144(y), r2=119(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 144
LDI r2, 119
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
