; DESCRIPTION: Draws a orange rectangle at (64, 123) with width 47 and height 41.
; PLAN: r0=64(x), r1=123(y), r2=47(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 123
LDI r2, 47
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
