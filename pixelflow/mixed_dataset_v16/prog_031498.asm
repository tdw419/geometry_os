; DESCRIPTION: Draws a green rectangle at (179, 199) with width 18 and height 41.
; PLAN: r0=179(x), r1=199(y), r2=18(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 199
LDI r2, 18
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
