; DESCRIPTION: Creates a orange rectangular region at (351, 90) spanning 36 by 44 pixels.
; PLAN: r0=351(x), r1=90(y), r2=36(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 90
LDI r2, 36
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
