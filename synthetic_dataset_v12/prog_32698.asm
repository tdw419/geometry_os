; DESCRIPTION: Renders a orange line between points (99, 169) and (60, 201).
; PLAN: r0=99(x1), r1=169(y1), r2=60(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 169
LDI r2, 60
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
