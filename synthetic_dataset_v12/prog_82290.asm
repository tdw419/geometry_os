; DESCRIPTION: Draws a purple rectangle at (58, 114) with width 78 and height 100.
; PLAN: r0=58(x), r1=114(y), r2=78(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 114
LDI r2, 78
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
