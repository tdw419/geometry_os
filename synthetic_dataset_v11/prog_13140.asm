; DESCRIPTION: Creates a orange rectangular region at (97, 137) spanning 71 by 21 pixels.
; PLAN: r0=97(x), r1=137(y), r2=71(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 137
LDI r2, 71
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
