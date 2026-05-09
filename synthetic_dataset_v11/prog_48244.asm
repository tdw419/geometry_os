; DESCRIPTION: Draws a purple rectangle at (22, 103) with width 17 and height 43.
; PLAN: r0=22(x), r1=103(y), r2=17(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 103
LDI r2, 17
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
