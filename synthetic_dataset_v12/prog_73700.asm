; DESCRIPTION: Draws a green rectangle at (88, 105) with width 93 and height 104.
; PLAN: r0=88(x), r1=105(y), r2=93(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 105
LDI r2, 93
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
