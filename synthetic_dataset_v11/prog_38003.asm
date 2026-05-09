; DESCRIPTION: Creates a green rectangular region at (212, 201) spanning 44 by 12 pixels.
; PLAN: r0=212(x), r1=201(y), r2=44(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 201
LDI r2, 44
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
