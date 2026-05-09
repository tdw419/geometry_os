; DESCRIPTION: Creates a orange rectangular region at (184, 90) spanning 41 by 54 pixels.
; PLAN: r0=184(x), r1=90(y), r2=41(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 90
LDI r2, 41
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
