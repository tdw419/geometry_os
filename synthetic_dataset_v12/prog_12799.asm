; DESCRIPTION: Draws a green rectangle at (68, 110) with width 77 and height 29.
; PLAN: r0=68(x), r1=110(y), r2=77(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 110
LDI r2, 77
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
