; DESCRIPTION: Draws a purple rectangle at (274, 77) with width 118 and height 108.
; PLAN: r0=274(x), r1=77(y), r2=118(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 77
LDI r2, 118
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
