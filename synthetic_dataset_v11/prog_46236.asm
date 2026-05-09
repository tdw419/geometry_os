; DESCRIPTION: Draws a yellow rectangle at (188, 158) with width 10 and height 56.
; PLAN: r0=188(x), r1=158(y), r2=10(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 158
LDI r2, 10
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
