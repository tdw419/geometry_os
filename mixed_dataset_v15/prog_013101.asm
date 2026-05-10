; DESCRIPTION: Draws a purple rectangle at (324, 219) with width 116 and height 15.
; PLAN: r0=324(x), r1=219(y), r2=116(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 219
LDI r2, 116
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
