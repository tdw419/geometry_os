; DESCRIPTION: Creates a orange rectangular region at (26, 119) spanning 78 by 21 pixels.
; PLAN: r0=26(x), r1=119(y), r2=78(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 119
LDI r2, 78
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
