; DESCRIPTION: Draws a yellow rectangle at (158, 10) with width 41 and height 15.
; PLAN: r0=158(x), r1=10(y), r2=41(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 10
LDI r2, 41
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
