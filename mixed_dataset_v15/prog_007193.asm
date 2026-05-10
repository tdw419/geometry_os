; DESCRIPTION: Draws a yellow rectangle at (430, 101) with width 80 and height 54.
; PLAN: r0=430(x), r1=101(y), r2=80(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 101
LDI r2, 80
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
