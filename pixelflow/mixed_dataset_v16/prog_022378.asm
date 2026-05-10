; DESCRIPTION: Draws a green rectangle at (316, 138) with width 73 and height 36.
; PLAN: r0=316(x), r1=138(y), r2=73(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 138
LDI r2, 73
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
