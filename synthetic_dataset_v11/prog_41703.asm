; DESCRIPTION: Draws a green rectangle at (123, 162) with width 78 and height 22.
; PLAN: r0=123(x), r1=162(y), r2=78(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 162
LDI r2, 78
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
