; DESCRIPTION: Draws a black rectangle at (131, 113) with width 105 and height 119.
; PLAN: r0=131(x), r1=113(y), r2=105(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 113
LDI r2, 105
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
