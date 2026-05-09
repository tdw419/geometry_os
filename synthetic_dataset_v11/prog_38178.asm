; DESCRIPTION: Draws a green rectangle at (158, 68) with width 55 and height 117.
; PLAN: r0=158(x), r1=68(y), r2=55(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 68
LDI r2, 55
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
