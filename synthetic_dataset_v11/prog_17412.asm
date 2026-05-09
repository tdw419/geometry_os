; DESCRIPTION: Draws a black rectangle at (19, 114) with width 20 and height 76.
; PLAN: r0=19(x), r1=114(y), r2=20(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 114
LDI r2, 20
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
