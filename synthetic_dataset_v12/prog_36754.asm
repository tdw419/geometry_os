; DESCRIPTION: Draws a purple rectangle at (84, 96) with width 69 and height 114.
; PLAN: r0=84(x), r1=96(y), r2=69(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 96
LDI r2, 69
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
