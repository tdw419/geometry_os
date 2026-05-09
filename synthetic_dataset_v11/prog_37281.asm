; DESCRIPTION: Creates a yellow rectangular region at (8, 201) spanning 80 by 54 pixels.
; PLAN: r0=8(x), r1=201(y), r2=80(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 201
LDI r2, 80
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
