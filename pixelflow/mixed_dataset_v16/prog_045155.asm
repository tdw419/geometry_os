; DESCRIPTION: Creates a orange rectangular region at (112, 170) spanning 114 by 62 pixels.
; PLAN: r0=112(x), r1=170(y), r2=114(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 170
LDI r2, 114
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
