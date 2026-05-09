; DESCRIPTION: Draws a black rectangle at (41, 30) with width 62 and height 69.
; PLAN: r0=41(x), r1=30(y), r2=62(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 30
LDI r2, 62
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
