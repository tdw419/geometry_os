; DESCRIPTION: Draws a yellow rectangle at (158, 106) with width 62 and height 102.
; PLAN: r0=158(x), r1=106(y), r2=62(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 106
LDI r2, 62
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
