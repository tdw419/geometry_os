; DESCRIPTION: Draws a green rectangle at (68, 83) with width 74 and height 55.
; PLAN: r0=68(x), r1=83(y), r2=74(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 83
LDI r2, 74
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
