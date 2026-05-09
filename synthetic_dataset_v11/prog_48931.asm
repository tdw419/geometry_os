; DESCRIPTION: Creates a white rectangular region at (81, 123) spanning 89 by 41 pixels.
; PLAN: r0=81(x), r1=123(y), r2=89(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 123
LDI r2, 89
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
