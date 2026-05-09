; DESCRIPTION: Creates a orange rectangular region at (18, 123) spanning 20 by 34 pixels.
; PLAN: r0=18(x), r1=123(y), r2=20(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 123
LDI r2, 20
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
