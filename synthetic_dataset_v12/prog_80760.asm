; DESCRIPTION: Draws a yellow rectangle at (41, 75) with width 119 and height 90.
; PLAN: r0=41(x), r1=75(y), r2=119(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 75
LDI r2, 119
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
