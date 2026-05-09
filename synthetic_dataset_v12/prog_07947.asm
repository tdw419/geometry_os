; DESCRIPTION: Creates a orange rectangular region at (41, 106) spanning 101 by 48 pixels.
; PLAN: r0=41(x), r1=106(y), r2=101(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 106
LDI r2, 101
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
