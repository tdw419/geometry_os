; DESCRIPTION: Creates a orange rectangular region at (41, 233) spanning 35 by 15 pixels.
; PLAN: r0=41(x), r1=233(y), r2=35(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 233
LDI r2, 35
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
