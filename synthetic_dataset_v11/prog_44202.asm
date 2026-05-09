; DESCRIPTION: Creates a orange rectangular region at (41, 149) spanning 79 by 61 pixels.
; PLAN: r0=41(x), r1=149(y), r2=79(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 149
LDI r2, 79
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
