; DESCRIPTION: Draws a purple rectangle at (323, 97) with width 69 and height 68.
; PLAN: r0=323(x), r1=97(y), r2=69(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 97
LDI r2, 69
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
