; DESCRIPTION: Draws a green rectangle at (137, 184) with width 34 and height 35.
; PLAN: r0=137(x), r1=184(y), r2=34(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 184
LDI r2, 34
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
