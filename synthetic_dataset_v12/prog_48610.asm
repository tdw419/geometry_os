; DESCRIPTION: Renders a purple line between points (508, 110) and (399, 179).
; PLAN: r0=508(x1), r1=110(y1), r2=399(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 110
LDI r2, 399
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
