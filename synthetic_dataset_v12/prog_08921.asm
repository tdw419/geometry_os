; DESCRIPTION: Draws a purple rectangle at (135, 101) with width 108 and height 62.
; PLAN: r0=135(x), r1=101(y), r2=108(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 101
LDI r2, 108
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
