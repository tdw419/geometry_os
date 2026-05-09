; DESCRIPTION: Draws a yellow rectangle at (41, 148) with width 88 and height 108.
; PLAN: r0=41(x), r1=148(y), r2=88(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 148
LDI r2, 88
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
