; DESCRIPTION: Creates a orange rectangular region at (9, 31) spanning 60 by 19 pixels.
; PLAN: r0=9(x), r1=31(y), r2=60(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 31
LDI r2, 60
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
