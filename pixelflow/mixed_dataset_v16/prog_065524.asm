; DESCRIPTION: Draws a purple rectangle at (426, 56) with width 12 and height 101.
; PLAN: r0=426(x), r1=56(y), r2=12(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 56
LDI r2, 12
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
