; DESCRIPTION: Creates a orange rectangular region at (219, 58) spanning 61 by 31 pixels.
; PLAN: r0=219(x), r1=58(y), r2=61(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 58
LDI r2, 61
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
