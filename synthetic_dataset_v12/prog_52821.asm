; DESCRIPTION: Draws a purple rectangle at (378, 62) with width 74 and height 85.
; PLAN: r0=378(x), r1=62(y), r2=74(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 62
LDI r2, 74
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
