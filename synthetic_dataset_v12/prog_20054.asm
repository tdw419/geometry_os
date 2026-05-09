; DESCRIPTION: Creates a orange rectangular region at (417, 101) spanning 44 by 87 pixels.
; PLAN: r0=417(x), r1=101(y), r2=44(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 101
LDI r2, 44
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
