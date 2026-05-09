; DESCRIPTION: Draws a purple rectangle at (348, 95) with width 86 and height 35.
; PLAN: r0=348(x), r1=95(y), r2=86(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 95
LDI r2, 86
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
