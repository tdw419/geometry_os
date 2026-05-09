; DESCRIPTION: Draws a green rectangle at (3, 41) with width 88 and height 26.
; PLAN: r0=3(x), r1=41(y), r2=88(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 41
LDI r2, 88
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
