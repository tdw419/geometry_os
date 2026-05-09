; DESCRIPTION: Draws a purple rectangle at (101, 64) with width 54 and height 78.
; PLAN: r0=101(x), r1=64(y), r2=54(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 64
LDI r2, 54
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
