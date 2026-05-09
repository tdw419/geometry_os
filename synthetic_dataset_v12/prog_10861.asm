; DESCRIPTION: Draws a black rectangle at (316, 119) with width 109 and height 118.
; PLAN: r0=316(x), r1=119(y), r2=109(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 119
LDI r2, 109
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
