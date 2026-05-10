; DESCRIPTION: Draws a purple rectangle at (23, 100) with width 11 and height 54.
; PLAN: r0=23(x), r1=100(y), r2=11(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 100
LDI r2, 11
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
