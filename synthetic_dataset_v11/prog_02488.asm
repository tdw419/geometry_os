; DESCRIPTION: Creates a orange rectangular region at (41, 24) spanning 109 by 70 pixels.
; PLAN: r0=41(x), r1=24(y), r2=109(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 24
LDI r2, 109
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
