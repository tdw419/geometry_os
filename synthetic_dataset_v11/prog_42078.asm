; DESCRIPTION: Draws a yellow rectangle at (41, 20) with width 101 and height 68.
; PLAN: r0=41(x), r1=20(y), r2=101(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 20
LDI r2, 101
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
