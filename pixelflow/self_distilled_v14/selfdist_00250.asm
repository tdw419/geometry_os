; DESCRIPTION: Draws a green rectangle at (108, 110) with width 104 and height 49.
; PLAN: r0=108(x), r1=110(y), r2=104(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 110
LDI r2, 104
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
