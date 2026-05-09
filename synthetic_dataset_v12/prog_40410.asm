; DESCRIPTION: Draws a purple rectangle at (316, 59) with width 114 and height 22.
; PLAN: r0=316(x), r1=59(y), r2=114(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 59
LDI r2, 114
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
