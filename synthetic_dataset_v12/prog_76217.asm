; DESCRIPTION: Draws a green rectangle at (88, 68) with width 117 and height 60.
; PLAN: r0=88(x), r1=68(y), r2=117(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 68
LDI r2, 117
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
