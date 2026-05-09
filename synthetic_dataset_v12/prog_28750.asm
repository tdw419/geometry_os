; DESCRIPTION: Draws a purple rectangle at (265, 88) with width 119 and height 103.
; PLAN: r0=265(x), r1=88(y), r2=119(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 88
LDI r2, 119
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
