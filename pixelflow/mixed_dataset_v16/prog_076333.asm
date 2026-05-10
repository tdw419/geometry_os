; DESCRIPTION: Draws a purple rectangle at (155, 78) with width 61 and height 23.
; PLAN: r0=155(x), r1=78(y), r2=61(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 78
LDI r2, 61
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
