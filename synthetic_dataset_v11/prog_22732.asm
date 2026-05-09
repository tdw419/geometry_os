; DESCRIPTION: Draws a yellow rectangle at (33, 81) with width 87 and height 118.
; PLAN: r0=33(x), r1=81(y), r2=87(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 81
LDI r2, 87
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
