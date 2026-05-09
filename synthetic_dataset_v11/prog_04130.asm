; DESCRIPTION: Draws a purple rectangle at (91, 10) with width 62 and height 74.
; PLAN: r0=91(x), r1=10(y), r2=62(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 10
LDI r2, 62
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
