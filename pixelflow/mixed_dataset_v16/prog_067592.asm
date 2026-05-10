; DESCRIPTION: Draws a green rectangle at (334, 105) with width 104 and height 73.
; PLAN: r0=334(x), r1=105(y), r2=104(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 105
LDI r2, 104
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
