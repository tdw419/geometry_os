; DESCRIPTION: Draws a yellow rectangle at (159, 11) with width 101 and height 66.
; PLAN: r0=159(x), r1=11(y), r2=101(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 11
LDI r2, 101
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
