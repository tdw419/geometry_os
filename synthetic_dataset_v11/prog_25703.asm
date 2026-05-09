; DESCRIPTION: Draws a green rectangle at (129, 54) with width 104 and height 71.
; PLAN: r0=129(x), r1=54(y), r2=104(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 54
LDI r2, 104
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
