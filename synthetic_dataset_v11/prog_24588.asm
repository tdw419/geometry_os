; DESCRIPTION: Renders a purple line between points (56, 100) and (55, 251).
; PLAN: r0=56(x1), r1=100(y1), r2=55(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 100
LDI r2, 55
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
