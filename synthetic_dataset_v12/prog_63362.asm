; DESCRIPTION: Draws a purple rectangle at (119, 51) with width 115 and height 45.
; PLAN: r0=119(x), r1=51(y), r2=115(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 51
LDI r2, 115
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
