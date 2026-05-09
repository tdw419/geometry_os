; DESCRIPTION: Draws a black rectangle at (78, 43) with width 102 and height 116.
; PLAN: r0=78(x), r1=43(y), r2=102(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 43
LDI r2, 102
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
