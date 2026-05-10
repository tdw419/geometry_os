; DESCRIPTION: Draws a green rectangle at (138, 139) with width 17 and height 38.
; PLAN: r0=138(x), r1=139(y), r2=17(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 139
LDI r2, 17
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
