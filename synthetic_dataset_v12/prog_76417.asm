; DESCRIPTION: Creates a orange rectangular region at (244, 119) spanning 13 by 83 pixels.
; PLAN: r0=244(x), r1=119(y), r2=13(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 119
LDI r2, 13
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
