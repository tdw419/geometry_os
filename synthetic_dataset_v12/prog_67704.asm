; DESCRIPTION: Creates a orange rectangular region at (266, 100) spanning 66 by 23 pixels.
; PLAN: r0=266(x), r1=100(y), r2=66(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 100
LDI r2, 66
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
