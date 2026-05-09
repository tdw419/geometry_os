; DESCRIPTION: Renders a yellow line between points (201, 110) and (486, 203).
; PLAN: r0=201(x1), r1=110(y1), r2=486(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 110
LDI r2, 486
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
