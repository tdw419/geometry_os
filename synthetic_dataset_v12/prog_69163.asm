; DESCRIPTION: Draws a purple rectangle at (378, 43) with width 22 and height 89.
; PLAN: r0=378(x), r1=43(y), r2=22(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 43
LDI r2, 22
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
