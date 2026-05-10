; DESCRIPTION: Draws a yellow rectangle at (65, 166) with width 68 and height 88.
; PLAN: r0=65(x), r1=166(y), r2=68(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 166
LDI r2, 68
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
