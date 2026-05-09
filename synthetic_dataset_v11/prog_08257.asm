; DESCRIPTION: Creates a orange rectangular region at (31, 57) spanning 19 by 101 pixels.
; PLAN: r0=31(x), r1=57(y), r2=19(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 57
LDI r2, 19
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
