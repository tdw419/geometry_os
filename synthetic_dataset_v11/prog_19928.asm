; DESCRIPTION: Creates a orange rectangular region at (173, 31) spanning 76 by 23 pixels.
; PLAN: r0=173(x), r1=31(y), r2=76(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 31
LDI r2, 76
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
