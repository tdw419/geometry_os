; DESCRIPTION: Draws a green rectangle at (106, 139) with width 71 and height 55.
; PLAN: r0=106(x), r1=139(y), r2=71(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 139
LDI r2, 71
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
