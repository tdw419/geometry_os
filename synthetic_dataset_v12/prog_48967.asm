; DESCRIPTION: Draws a purple rectangle at (43, 142) with width 116 and height 76.
; PLAN: r0=43(x), r1=142(y), r2=116(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 142
LDI r2, 116
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
