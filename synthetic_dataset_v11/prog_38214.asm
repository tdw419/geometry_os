; DESCRIPTION: Draws a red rectangle at (158, 159) with width 41 and height 52.
; PLAN: r0=158(x), r1=159(y), r2=41(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 159
LDI r2, 41
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
