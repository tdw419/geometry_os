; DESCRIPTION: Draws a purple rectangle at (65, 110) with width 62 and height 26.
; PLAN: r0=65(x), r1=110(y), r2=62(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 110
LDI r2, 62
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
