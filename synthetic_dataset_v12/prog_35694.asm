; DESCRIPTION: Creates a orange rectangular region at (13, 3) spanning 115 by 31 pixels.
; PLAN: r0=13(x), r1=3(y), r2=115(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 3
LDI r2, 115
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
