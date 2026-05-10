; DESCRIPTION: Creates a orange rectangular region at (409, 156) spanning 99 by 61 pixels.
; PLAN: r0=409(x), r1=156(y), r2=99(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 156
LDI r2, 99
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
