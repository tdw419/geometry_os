; DESCRIPTION: Creates a orange rectangular region at (199, 119) spanning 66 by 40 pixels.
; PLAN: r0=199(x), r1=119(y), r2=66(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 119
LDI r2, 66
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
