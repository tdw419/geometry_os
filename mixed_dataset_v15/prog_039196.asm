; DESCRIPTION: Draws a green rectangle at (191, 139) with width 22 and height 91.
; PLAN: r0=191(x), r1=139(y), r2=22(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 139
LDI r2, 22
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
