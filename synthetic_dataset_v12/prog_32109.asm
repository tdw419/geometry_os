; DESCRIPTION: Draws a green rectangle at (347, 158) with width 33 and height 38.
; PLAN: r0=347(x), r1=158(y), r2=33(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 158
LDI r2, 33
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
