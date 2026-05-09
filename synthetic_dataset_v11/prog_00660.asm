; DESCRIPTION: Draws a purple rectangle at (137, 78) with width 57 and height 119.
; PLAN: r0=137(x), r1=78(y), r2=57(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 78
LDI r2, 57
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
