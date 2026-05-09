; DESCRIPTION: Creates a orange rectangular region at (99, 123) spanning 112 by 72 pixels.
; PLAN: r0=99(x), r1=123(y), r2=112(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 123
LDI r2, 112
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
