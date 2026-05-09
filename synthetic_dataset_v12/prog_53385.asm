; DESCRIPTION: Draws a yellow rectangle at (65, 122) with width 41 and height 97.
; PLAN: r0=65(x), r1=122(y), r2=41(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 122
LDI r2, 41
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
