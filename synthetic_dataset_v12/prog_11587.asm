; DESCRIPTION: Draws a yellow rectangle at (132, 190) with width 118 and height 26.
; PLAN: r0=132(x), r1=190(y), r2=118(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 190
LDI r2, 118
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
