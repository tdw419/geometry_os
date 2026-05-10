; DESCRIPTION: Draws a purple rectangle at (70, 52) with width 13 and height 78.
; PLAN: r0=70(x), r1=52(y), r2=13(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 52
LDI r2, 13
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
