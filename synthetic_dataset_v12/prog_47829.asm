; DESCRIPTION: Draws a green rectangle at (41, 36) with width 66 and height 101.
; PLAN: r0=41(x), r1=36(y), r2=66(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 36
LDI r2, 66
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
