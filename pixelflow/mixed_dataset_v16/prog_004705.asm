; DESCRIPTION: Creates a white rectangular region at (24, 89) spanning 41 by 26 pixels.
; PLAN: r0=24(x), r1=89(y), r2=41(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 89
LDI r2, 41
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
