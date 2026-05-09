; DESCRIPTION: Draws a purple rectangle at (356, 122) with width 77 and height 54.
; PLAN: r0=356(x), r1=122(y), r2=77(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 122
LDI r2, 77
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
