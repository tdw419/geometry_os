; DESCRIPTION: Draws a blue rectangle at (155, 88) with width 31 and height 86.
; PLAN: r0=155(x), r1=88(y), r2=31(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 88
LDI r2, 31
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
