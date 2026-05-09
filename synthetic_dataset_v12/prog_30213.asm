; DESCRIPTION: Places a white line segment connecting (13, 201) to (318, 60).
; PLAN: r0=13(x1), r1=201(y1), r2=318(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 201
LDI r2, 318
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
