; DESCRIPTION: Renders a yellow line between points (142, 201) and (1, 20).
; PLAN: r0=142(x1), r1=201(y1), r2=1(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 201
LDI r2, 1
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
