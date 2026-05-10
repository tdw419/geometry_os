; DESCRIPTION: Draws a orange rectangle at (161, 41) with width 18 and height 43.
; PLAN: r0=161(x), r1=41(y), r2=18(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 41
LDI r2, 18
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
