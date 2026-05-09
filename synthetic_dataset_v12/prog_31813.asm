; DESCRIPTION: Draws a orange rectangle at (162, 82) with width 76 and height 41.
; PLAN: r0=162(x), r1=82(y), r2=76(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 82
LDI r2, 76
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
