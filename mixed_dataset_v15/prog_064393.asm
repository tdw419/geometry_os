; DESCRIPTION: Draws a green rectangle at (22, 41) with width 95 and height 88.
; PLAN: r0=22(x), r1=41(y), r2=95(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 41
LDI r2, 95
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
