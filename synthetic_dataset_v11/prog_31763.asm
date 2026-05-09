; DESCRIPTION: Renders a yellow line between points (233, 201) and (188, 87).
; PLAN: r0=233(x1), r1=201(y1), r2=188(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 201
LDI r2, 188
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
