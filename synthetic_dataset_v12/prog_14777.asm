; DESCRIPTION: Draws a orange rectangle at (364, 95) with width 41 and height 82.
; PLAN: r0=364(x), r1=95(y), r2=41(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 95
LDI r2, 41
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
