; DESCRIPTION: Creates a yellow rectangular region at (323, 13) spanning 106 by 77 pixels.
; PLAN: r0=323(x), r1=13(y), r2=106(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 13
LDI r2, 106
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
