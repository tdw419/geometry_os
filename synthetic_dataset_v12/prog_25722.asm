; DESCRIPTION: Draws a purple rectangle at (274, 2) with width 87 and height 25.
; PLAN: r0=274(x), r1=2(y), r2=87(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 2
LDI r2, 87
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
