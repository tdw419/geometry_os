; DESCRIPTION: Draws a orange rectangle at (49, 68) with width 84 and height 41.
; PLAN: r0=49(x), r1=68(y), r2=84(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 68
LDI r2, 84
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
