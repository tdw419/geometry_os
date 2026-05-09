; DESCRIPTION: Draws a purple rectangle at (356, 7) with width 114 and height 97.
; PLAN: r0=356(x), r1=7(y), r2=114(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 7
LDI r2, 114
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
