; DESCRIPTION: Draws a purple rectangle at (351, 75) with width 68 and height 24.
; PLAN: r0=351(x), r1=75(y), r2=68(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 75
LDI r2, 68
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
