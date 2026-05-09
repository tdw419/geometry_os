; DESCRIPTION: Draws a yellow rectangle at (24, 97) with width 117 and height 81.
; PLAN: r0=24(x), r1=97(y), r2=117(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 97
LDI r2, 117
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
