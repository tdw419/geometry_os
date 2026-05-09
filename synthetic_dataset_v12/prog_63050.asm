; DESCRIPTION: Draws a blue rectangle at (141, 142) with width 118 and height 76.
; PLAN: r0=141(x), r1=142(y), r2=118(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 142
LDI r2, 118
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
