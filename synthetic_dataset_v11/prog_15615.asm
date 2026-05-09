; DESCRIPTION: Draws a black rectangle at (89, 41) with width 69 and height 116.
; PLAN: r0=89(x), r1=41(y), r2=69(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 41
LDI r2, 69
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
