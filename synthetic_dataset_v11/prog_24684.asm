; DESCRIPTION: Draws a yellow rectangle at (159, 110) with width 49 and height 17.
; PLAN: r0=159(x), r1=110(y), r2=49(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 110
LDI r2, 49
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
