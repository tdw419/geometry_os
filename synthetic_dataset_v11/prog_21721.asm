; DESCRIPTION: Draws a purple rectangle at (33, 43) with width 95 and height 101.
; PLAN: r0=33(x), r1=43(y), r2=95(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 43
LDI r2, 95
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
