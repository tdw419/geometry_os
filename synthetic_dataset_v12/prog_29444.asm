; DESCRIPTION: Creates a orange rectangular region at (304, 105) spanning 93 by 41 pixels.
; PLAN: r0=304(x), r1=105(y), r2=93(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 105
LDI r2, 93
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
