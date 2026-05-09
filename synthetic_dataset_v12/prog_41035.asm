; DESCRIPTION: Creates a yellow rectangular region at (363, 8) spanning 81 by 87 pixels.
; PLAN: r0=363(x), r1=8(y), r2=81(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 8
LDI r2, 81
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
