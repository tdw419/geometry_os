; DESCRIPTION: Draws a purple rectangle at (348, 219) with width 59 and height 25.
; PLAN: r0=348(x), r1=219(y), r2=59(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 219
LDI r2, 59
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
