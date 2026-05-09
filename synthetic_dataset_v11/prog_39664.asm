; DESCRIPTION: Draws a yellow rectangle at (55, 40) with width 81 and height 106.
; PLAN: r0=55(x), r1=40(y), r2=81(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 40
LDI r2, 81
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
