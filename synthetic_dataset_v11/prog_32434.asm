; DESCRIPTION: Draws a yellow rectangle at (190, 179) with width 22 and height 74.
; PLAN: r0=190(x), r1=179(y), r2=22(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 179
LDI r2, 22
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
