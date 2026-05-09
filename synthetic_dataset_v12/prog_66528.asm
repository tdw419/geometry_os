; DESCRIPTION: Draws a purple rectangle at (264, 158) with width 77 and height 24.
; PLAN: r0=264(x), r1=158(y), r2=77(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 158
LDI r2, 77
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
