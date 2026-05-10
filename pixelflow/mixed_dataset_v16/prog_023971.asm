; DESCRIPTION: Draws a yellow rectangle at (312, 54) with width 117 and height 36.
; PLAN: r0=312(x), r1=54(y), r2=117(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 54
LDI r2, 117
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
