; DESCRIPTION: Draws a purple rectangle at (407, 96) with width 24 and height 112.
; PLAN: r0=407(x), r1=96(y), r2=24(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 96
LDI r2, 24
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
