; DESCRIPTION: Draws a black rectangle at (159, 17) with width 78 and height 37.
; PLAN: r0=159(x), r1=17(y), r2=78(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 17
LDI r2, 78
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
