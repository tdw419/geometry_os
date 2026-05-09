; DESCRIPTION: Draws a purple rectangle at (122, 109) with width 34 and height 81.
; PLAN: r0=122(x), r1=109(y), r2=34(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 109
LDI r2, 34
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
