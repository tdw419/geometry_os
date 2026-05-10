; DESCRIPTION: Creates a orange rectangular region at (115, 31) spanning 101 by 82 pixels.
; PLAN: r0=115(x), r1=31(y), r2=101(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 31
LDI r2, 101
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
