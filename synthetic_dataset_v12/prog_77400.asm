; DESCRIPTION: Creates a orange rectangular region at (355, 123) spanning 84 by 18 pixels.
; PLAN: r0=355(x), r1=123(y), r2=84(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 123
LDI r2, 84
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
