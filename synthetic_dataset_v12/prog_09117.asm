; DESCRIPTION: Draws a yellow rectangle at (227, 75) with width 75 and height 68.
; PLAN: r0=227(x), r1=75(y), r2=75(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 75
LDI r2, 75
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
