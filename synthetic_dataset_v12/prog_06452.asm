; DESCRIPTION: Draws a green rectangle at (78, 138) with width 68 and height 75.
; PLAN: r0=78(x), r1=138(y), r2=68(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 138
LDI r2, 68
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
