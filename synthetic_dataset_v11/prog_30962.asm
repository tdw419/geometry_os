; DESCRIPTION: Creates a orange rectangular region at (161, 85) spanning 56 by 62 pixels.
; PLAN: r0=161(x), r1=85(y), r2=56(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 85
LDI r2, 56
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
