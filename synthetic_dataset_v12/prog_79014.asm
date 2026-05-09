; DESCRIPTION: Creates a orange rectangular region at (129, 49) spanning 22 by 78 pixels.
; PLAN: r0=129(x), r1=49(y), r2=22(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 49
LDI r2, 22
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
