; DESCRIPTION: Creates a orange rectangular region at (331, 214) spanning 43 by 31 pixels.
; PLAN: r0=331(x), r1=214(y), r2=43(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 214
LDI r2, 43
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
