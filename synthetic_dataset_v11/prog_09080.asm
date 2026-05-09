; DESCRIPTION: Draws a white rectangle at (94, 155) with width 119 and height 15.
; PLAN: r0=94(x), r1=155(y), r2=119(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 155
LDI r2, 119
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
