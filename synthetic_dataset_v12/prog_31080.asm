; DESCRIPTION: Draws a orange rectangle at (41, 206) with width 119 and height 37.
; PLAN: r0=41(x), r1=206(y), r2=119(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 206
LDI r2, 119
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
