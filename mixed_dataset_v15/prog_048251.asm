; DESCRIPTION: Places a green line segment connecting (293, 201) to (15, 55).
; PLAN: r0=293(x1), r1=201(y1), r2=15(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 201
LDI r2, 15
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
