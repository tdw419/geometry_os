; DESCRIPTION: Creates a orange rectangular region at (396, 177) spanning 105 by 41 pixels.
; PLAN: r0=396(x), r1=177(y), r2=105(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 177
LDI r2, 105
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
