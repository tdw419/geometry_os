; DESCRIPTION: Creates a orange rectangular region at (180, 100) spanning 41 by 95 pixels.
; PLAN: r0=180(x), r1=100(y), r2=41(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 100
LDI r2, 41
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
