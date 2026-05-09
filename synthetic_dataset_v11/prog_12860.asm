; DESCRIPTION: Draws a yellow rectangle at (13, 101) with width 40 and height 87.
; PLAN: r0=13(x), r1=101(y), r2=40(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 101
LDI r2, 40
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
