; DESCRIPTION: Places a green line segment connecting (183, 29) to (364, 201).
; PLAN: r0=183(x1), r1=29(y1), r2=364(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 29
LDI r2, 364
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
