; DESCRIPTION: Draws a black rectangle at (159, 136) with width 43 and height 70.
; PLAN: r0=159(x), r1=136(y), r2=43(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 136
LDI r2, 43
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
