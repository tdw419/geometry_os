; DESCRIPTION: Creates a orange rectangular region at (471, 110) spanning 28 by 72 pixels.
; PLAN: r0=471(x), r1=110(y), r2=28(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 110
LDI r2, 28
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
