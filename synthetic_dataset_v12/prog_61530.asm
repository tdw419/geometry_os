; DESCRIPTION: Creates a orange rectangular region at (144, 29) spanning 31 by 44 pixels.
; PLAN: r0=144(x), r1=29(y), r2=31(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 29
LDI r2, 31
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
