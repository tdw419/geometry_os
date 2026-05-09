; DESCRIPTION: Creates a orange rectangular region at (299, 162) spanning 85 by 14 pixels.
; PLAN: r0=299(x), r1=162(y), r2=85(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 162
LDI r2, 85
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
