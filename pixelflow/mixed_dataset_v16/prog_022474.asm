; DESCRIPTION: Places a yellow line segment connecting (61, 120) to (321, 201).
; PLAN: r0=61(x1), r1=120(y1), r2=321(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 120
LDI r2, 321
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
