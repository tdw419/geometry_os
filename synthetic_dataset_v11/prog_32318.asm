; DESCRIPTION: Creates a green rectangular region at (122, 218) spanning 87 by 22 pixels.
; PLAN: r0=122(x), r1=218(y), r2=87(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 218
LDI r2, 87
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
