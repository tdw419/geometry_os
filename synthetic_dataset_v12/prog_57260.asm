; DESCRIPTION: Renders a yellow line between points (508, 99) and (230, 201).
; PLAN: r0=508(x1), r1=99(y1), r2=230(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 99
LDI r2, 230
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
