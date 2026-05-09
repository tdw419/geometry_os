; DESCRIPTION: Draws a purple rectangle at (28, 85) with width 110 and height 28.
; PLAN: r0=28(x), r1=85(y), r2=110(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 85
LDI r2, 110
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
