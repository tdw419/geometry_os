; DESCRIPTION: Draws a yellow rectangle at (323, 41) with width 81 and height 55.
; PLAN: r0=323(x), r1=41(y), r2=81(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 41
LDI r2, 81
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
