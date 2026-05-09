; DESCRIPTION: Draws a purple rectangle at (80, 123) with width 84 and height 64.
; PLAN: r0=80(x), r1=123(y), r2=84(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 123
LDI r2, 84
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
