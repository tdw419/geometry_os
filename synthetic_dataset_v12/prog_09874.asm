; DESCRIPTION: Creates a orange rectangular region at (261, 31) spanning 11 by 53 pixels.
; PLAN: r0=261(x), r1=31(y), r2=11(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 31
LDI r2, 11
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
