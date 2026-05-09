; DESCRIPTION: Draws a blue rectangle at (51, 106) with width 119 and height 106.
; PLAN: r0=51(x), r1=106(y), r2=119(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 106
LDI r2, 119
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
