; DESCRIPTION: Creates a green rectangular region at (149, 218) spanning 110 by 17 pixels.
; PLAN: r0=149(x), r1=218(y), r2=110(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 218
LDI r2, 110
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
