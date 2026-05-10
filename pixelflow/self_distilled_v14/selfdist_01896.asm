; DESCRIPTION: Draws a yellow rectangle at (270, 11) with width 101 and height 13.
; PLAN: r0=270(x), r1=11(y), r2=101(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 11
LDI r2, 101
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
