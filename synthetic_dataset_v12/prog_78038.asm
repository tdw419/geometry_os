; DESCRIPTION: Draws a blue rectangle at (185, 89) with width 119 and height 39.
; PLAN: r0=185(x), r1=89(y), r2=119(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 89
LDI r2, 119
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
