; DESCRIPTION: Renders a yellow line between points (181, 118) and (14, 201).
; PLAN: r0=181(x1), r1=118(y1), r2=14(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 118
LDI r2, 14
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
