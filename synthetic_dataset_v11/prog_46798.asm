; DESCRIPTION: Draws a green rectangle at (88, 4) with width 73 and height 114.
; PLAN: r0=88(x), r1=4(y), r2=73(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 4
LDI r2, 73
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
