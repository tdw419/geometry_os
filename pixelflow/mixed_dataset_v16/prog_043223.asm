; DESCRIPTION: Draws a yellow rectangle at (103, 118) with width 46 and height 54.
; PLAN: r0=103(x), r1=118(y), r2=46(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 118
LDI r2, 46
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
