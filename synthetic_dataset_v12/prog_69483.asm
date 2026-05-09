; DESCRIPTION: Creates a green rectangular region at (201, 185) spanning 39 by 37 pixels.
; PLAN: r0=201(x), r1=185(y), r2=39(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 185
LDI r2, 39
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
