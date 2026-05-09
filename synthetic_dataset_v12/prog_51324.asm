; DESCRIPTION: Draws a black rectangle at (155, 105) with width 63 and height 98.
; PLAN: r0=155(x), r1=105(y), r2=63(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 105
LDI r2, 63
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
