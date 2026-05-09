; DESCRIPTION: Draws a purple rectangle at (139, 36) with width 110 and height 106.
; PLAN: r0=139(x), r1=36(y), r2=110(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 36
LDI r2, 110
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
