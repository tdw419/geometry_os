; DESCRIPTION: Renders a green line between points (337, 198) and (106, 201).
; PLAN: r0=337(x1), r1=198(y1), r2=106(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 198
LDI r2, 106
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
