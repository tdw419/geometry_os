; DESCRIPTION: Draws a orange rectangle at (472, 45) with width 18 and height 41.
; PLAN: r0=472(x), r1=45(y), r2=18(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 45
LDI r2, 18
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
