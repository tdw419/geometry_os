; DESCRIPTION: Draws a yellow rectangle at (292, 138) with width 41 and height 97.
; PLAN: r0=292(x), r1=138(y), r2=41(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 138
LDI r2, 41
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
