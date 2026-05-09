; DESCRIPTION: Draws a purple rectangle at (261, 73) with width 106 and height 89.
; PLAN: r0=261(x), r1=73(y), r2=106(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 73
LDI r2, 106
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
