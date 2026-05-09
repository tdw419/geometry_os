; DESCRIPTION: Draws a purple rectangle at (102, 77) with width 114 and height 43.
; PLAN: r0=102(x), r1=77(y), r2=114(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 77
LDI r2, 114
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
