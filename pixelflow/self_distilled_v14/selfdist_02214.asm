; DESCRIPTION: Draws a purple rectangle at (89, 171) with width 51 and height 30.
; PLAN: r0=89(x), r1=171(y), r2=51(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 171
LDI r2, 51
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
