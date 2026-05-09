; DESCRIPTION: Draws a purple rectangle at (51, 95) with width 108 and height 118.
; PLAN: r0=51(x), r1=95(y), r2=108(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 95
LDI r2, 108
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
