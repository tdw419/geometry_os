; DESCRIPTION: Draws a purple rectangle at (266, 94) with width 13 and height 20.
; PLAN: r0=266(x), r1=94(y), r2=13(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 94
LDI r2, 13
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
