; DESCRIPTION: Draws a blue rectangle at (358, 55) with width 119 and height 22.
; PLAN: r0=358(x), r1=55(y), r2=119(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 55
LDI r2, 119
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
