; DESCRIPTION: Creates a orange rectangular region at (109, 31) spanning 91 by 106 pixels.
; PLAN: r0=109(x), r1=31(y), r2=91(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 31
LDI r2, 91
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
