; DESCRIPTION: Draws a purple rectangle at (13, 63) with width 20 and height 81.
; PLAN: r0=13(x), r1=63(y), r2=20(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 63
LDI r2, 20
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
