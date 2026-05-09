; DESCRIPTION: Draws a blue rectangle at (163, 70) with width 105 and height 112.
; PLAN: r0=163(x), r1=70(y), r2=105(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 70
LDI r2, 105
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
