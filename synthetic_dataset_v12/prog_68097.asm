; DESCRIPTION: Draws a magenta rectangle at (159, 105) with width 45 and height 119.
; PLAN: r0=159(x), r1=105(y), r2=45(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 105
LDI r2, 45
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
