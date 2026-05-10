; DESCRIPTION: Draws a green rectangle at (302, 78) with width 74 and height 104.
; PLAN: r0=302(x), r1=78(y), r2=74(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 78
LDI r2, 74
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
