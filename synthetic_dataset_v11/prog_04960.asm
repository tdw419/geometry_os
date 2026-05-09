; DESCRIPTION: Draws a yellow rectangle at (51, 24) with width 101 and height 13.
; PLAN: r0=51(x), r1=24(y), r2=101(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 24
LDI r2, 101
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
