; DESCRIPTION: Creates a white rectangular region at (159, 145) spanning 41 by 26 pixels.
; PLAN: r0=159(x), r1=145(y), r2=41(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 145
LDI r2, 41
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
