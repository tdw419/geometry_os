; DESCRIPTION: Draws a yellow rectangle at (66, 118) with width 35 and height 81.
; PLAN: r0=66(x), r1=118(y), r2=35(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 118
LDI r2, 35
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
