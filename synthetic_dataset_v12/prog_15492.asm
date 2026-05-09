; DESCRIPTION: Draws a purple rectangle at (41, 103) with width 118 and height 88.
; PLAN: r0=41(x), r1=103(y), r2=118(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 103
LDI r2, 118
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
