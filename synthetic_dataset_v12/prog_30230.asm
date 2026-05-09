; DESCRIPTION: Renders a purple line between points (61, 16) and (201, 106).
; PLAN: r0=61(x1), r1=16(y1), r2=201(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 16
LDI r2, 201
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
