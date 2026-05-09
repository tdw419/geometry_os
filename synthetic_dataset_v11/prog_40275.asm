; DESCRIPTION: Renders a purple line between points (179, 252) and (95, 201).
; PLAN: r0=179(x1), r1=252(y1), r2=95(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 252
LDI r2, 95
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
