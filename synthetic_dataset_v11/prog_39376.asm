; DESCRIPTION: Draws a purple rectangle at (140, 73) with width 51 and height 56.
; PLAN: r0=140(x), r1=73(y), r2=51(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 73
LDI r2, 51
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
