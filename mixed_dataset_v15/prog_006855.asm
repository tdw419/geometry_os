; DESCRIPTION: Draws a purple rectangle at (142, 113) with width 43 and height 108.
; PLAN: r0=142(x), r1=113(y), r2=43(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 113
LDI r2, 43
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
