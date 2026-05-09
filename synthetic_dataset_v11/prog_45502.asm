; DESCRIPTION: Creates a green rectangular region at (124, 123) spanning 30 by 110 pixels.
; PLAN: r0=124(x), r1=123(y), r2=30(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 123
LDI r2, 30
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
