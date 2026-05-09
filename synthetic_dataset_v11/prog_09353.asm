; DESCRIPTION: Draws a orange rectangle at (90, 41) with width 100 and height 101.
; PLAN: r0=90(x), r1=41(y), r2=100(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 41
LDI r2, 100
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
