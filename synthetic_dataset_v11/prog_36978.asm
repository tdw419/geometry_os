; DESCRIPTION: Creates a orange rectangular region at (86, 31) spanning 110 by 59 pixels.
; PLAN: r0=86(x), r1=31(y), r2=110(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 31
LDI r2, 110
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
