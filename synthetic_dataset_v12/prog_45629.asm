; DESCRIPTION: Places a yellow line segment connecting (278, 23) to (12, 201).
; PLAN: r0=278(x1), r1=23(y1), r2=12(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 23
LDI r2, 12
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
