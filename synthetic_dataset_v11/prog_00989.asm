; DESCRIPTION: Draws a purple rectangle at (71, 69) with width 89 and height 110.
; PLAN: r0=71(x), r1=69(y), r2=89(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 69
LDI r2, 89
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
