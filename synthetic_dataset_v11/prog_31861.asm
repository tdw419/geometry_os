; DESCRIPTION: Draws a yellow rectangle at (177, 118) with width 12 and height 23.
; PLAN: r0=177(x), r1=118(y), r2=12(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 118
LDI r2, 12
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
