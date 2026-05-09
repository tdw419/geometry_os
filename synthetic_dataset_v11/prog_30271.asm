; DESCRIPTION: Draws a yellow rectangle at (166, 198) with width 81 and height 47.
; PLAN: r0=166(x), r1=198(y), r2=81(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 198
LDI r2, 81
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
