; DESCRIPTION: Draws a purple rectangle at (451, 97) with width 54 and height 89.
; PLAN: r0=451(x), r1=97(y), r2=54(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 97
LDI r2, 54
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
