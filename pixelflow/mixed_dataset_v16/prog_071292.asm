; DESCRIPTION: Draws a purple rectangle at (71, 101) with width 106 and height 100.
; PLAN: r0=71(x), r1=101(y), r2=106(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 101
LDI r2, 106
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
