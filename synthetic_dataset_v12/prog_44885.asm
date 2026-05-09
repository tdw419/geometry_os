; DESCRIPTION: Draws a green rectangle at (292, 153) with width 41 and height 55.
; PLAN: r0=292(x), r1=153(y), r2=41(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 153
LDI r2, 41
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
