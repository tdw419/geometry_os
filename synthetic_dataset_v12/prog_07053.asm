; DESCRIPTION: Draws a purple rectangle at (62, 141) with width 22 and height 112.
; PLAN: r0=62(x), r1=141(y), r2=22(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 141
LDI r2, 22
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
