; DESCRIPTION: Draws a blue rectangle at (119, 185) with width 18 and height 33.
; PLAN: r0=119(x), r1=185(y), r2=18(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 185
LDI r2, 18
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
