; DESCRIPTION: Draws a green rectangle at (122, 142) with width 55 and height 114.
; PLAN: r0=122(x), r1=142(y), r2=55(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 142
LDI r2, 55
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
