; DESCRIPTION: Creates a yellow rectangular region at (145, 158) spanning 87 by 31 pixels.
; PLAN: r0=145(x), r1=158(y), r2=87(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 158
LDI r2, 87
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
