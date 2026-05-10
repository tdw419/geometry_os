; DESCRIPTION: Renders a purple line between points (260, 115) and (486, 23).
; PLAN: r0=260(x1), r1=115(y1), r2=486(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 115
LDI r2, 486
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
