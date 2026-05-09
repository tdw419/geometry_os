; DESCRIPTION: Creates a orange rectangular region at (429, 81) spanning 81 by 41 pixels.
; PLAN: r0=429(x), r1=81(y), r2=81(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 81
LDI r2, 81
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
