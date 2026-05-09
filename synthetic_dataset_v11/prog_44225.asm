; DESCRIPTION: Draws a purple rectangle at (100, 66) with width 78 and height 86.
; PLAN: r0=100(x), r1=66(y), r2=78(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 66
LDI r2, 78
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
