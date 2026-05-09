; DESCRIPTION: Draws a purple rectangle at (189, 118) with width 56 and height 51.
; PLAN: r0=189(x), r1=118(y), r2=56(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 118
LDI r2, 56
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
