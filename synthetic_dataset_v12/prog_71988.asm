; DESCRIPTION: Draws a purple rectangle at (451, 135) with width 54 and height 78.
; PLAN: r0=451(x), r1=135(y), r2=54(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 135
LDI r2, 54
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
