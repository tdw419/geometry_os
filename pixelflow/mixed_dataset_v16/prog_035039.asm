; DESCRIPTION: Draws a yellow rectangle at (74, 118) with width 36 and height 104.
; PLAN: r0=74(x), r1=118(y), r2=36(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 118
LDI r2, 36
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
