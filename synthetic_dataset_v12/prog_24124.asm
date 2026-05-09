; DESCRIPTION: Draws a purple rectangle at (329, 133) with width 29 and height 88.
; PLAN: r0=329(x), r1=133(y), r2=29(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 133
LDI r2, 29
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
