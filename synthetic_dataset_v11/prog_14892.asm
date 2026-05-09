; DESCRIPTION: Draws a purple rectangle at (56, 179) with width 106 and height 33.
; PLAN: r0=56(x), r1=179(y), r2=106(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 179
LDI r2, 106
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
