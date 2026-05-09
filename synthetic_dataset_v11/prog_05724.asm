; DESCRIPTION: Draws a yellow rectangle at (123, 158) with width 64 and height 26.
; PLAN: r0=123(x), r1=158(y), r2=64(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 158
LDI r2, 64
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
