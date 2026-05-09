; DESCRIPTION: Draws a red rectangle at (41, 18) with width 108 and height 43.
; PLAN: r0=41(x), r1=18(y), r2=108(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 18
LDI r2, 108
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
