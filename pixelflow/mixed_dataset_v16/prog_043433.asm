; DESCRIPTION: Creates a orange rectangular region at (47, 102) spanning 46 by 23 pixels.
; PLAN: r0=47(x), r1=102(y), r2=46(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 102
LDI r2, 46
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
