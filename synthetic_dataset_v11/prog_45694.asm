; DESCRIPTION: Creates a orange rectangular region at (89, 157) spanning 110 by 86 pixels.
; PLAN: r0=89(x), r1=157(y), r2=110(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 157
LDI r2, 110
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
