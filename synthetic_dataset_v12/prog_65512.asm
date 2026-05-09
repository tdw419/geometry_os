; DESCRIPTION: Creates a orange rectangular region at (124, 122) spanning 44 by 89 pixels.
; PLAN: r0=124(x), r1=122(y), r2=44(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 122
LDI r2, 44
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
