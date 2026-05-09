; DESCRIPTION: Draws a purple rectangle at (127, 100) with width 108 and height 88.
; PLAN: r0=127(x), r1=100(y), r2=108(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 100
LDI r2, 108
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
