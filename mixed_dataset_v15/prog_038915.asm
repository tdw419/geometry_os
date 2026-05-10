; DESCRIPTION: Draws a blue rectangle at (142, 134) with width 105 and height 92.
; PLAN: r0=142(x), r1=134(y), r2=105(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 134
LDI r2, 105
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
