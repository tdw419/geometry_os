; DESCRIPTION: Draws a purple rectangle at (332, 92) with width 112 and height 114.
; PLAN: r0=332(x), r1=92(y), r2=112(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 92
LDI r2, 112
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
