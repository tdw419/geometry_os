; DESCRIPTION: Draws a green rectangle at (55, 139) with width 118 and height 74.
; PLAN: r0=55(x), r1=139(y), r2=118(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 139
LDI r2, 118
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
