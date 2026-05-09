; DESCRIPTION: Draws a purple rectangle at (219, 140) with width 29 and height 92.
; PLAN: r0=219(x), r1=140(y), r2=29(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 140
LDI r2, 29
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
