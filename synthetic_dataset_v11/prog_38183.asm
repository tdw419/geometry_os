; DESCRIPTION: Draws a orange rectangle at (41, 49) with width 60 and height 59.
; PLAN: r0=41(x), r1=49(y), r2=60(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 49
LDI r2, 60
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
