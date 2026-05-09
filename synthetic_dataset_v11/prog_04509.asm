; DESCRIPTION: Draws a purple rectangle at (26, 87) with width 49 and height 21.
; PLAN: r0=26(x), r1=87(y), r2=49(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 87
LDI r2, 49
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
