; DESCRIPTION: Draws a purple rectangle at (15, 43) with width 27 and height 112.
; PLAN: r0=15(x), r1=43(y), r2=27(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 43
LDI r2, 27
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
