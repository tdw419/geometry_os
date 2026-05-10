; DESCRIPTION: Draws a yellow rectangle at (369, 117) with width 54 and height 90.
; PLAN: r0=369(x), r1=117(y), r2=54(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 117
LDI r2, 54
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
