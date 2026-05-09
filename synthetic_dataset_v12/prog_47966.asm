; DESCRIPTION: Creates a yellow rectangular region at (83, 77) spanning 106 by 81 pixels.
; PLAN: r0=83(x), r1=77(y), r2=106(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 77
LDI r2, 106
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
