; DESCRIPTION: Draws a purple rectangle at (159, 138) with width 81 and height 116.
; PLAN: r0=159(x), r1=138(y), r2=81(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 138
LDI r2, 81
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
