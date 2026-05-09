; DESCRIPTION: Draws a purple rectangle at (88, 183) with width 92 and height 68.
; PLAN: r0=88(x), r1=183(y), r2=92(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 183
LDI r2, 92
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
