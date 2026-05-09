; DESCRIPTION: Renders a purple line between points (141, 115) and (3, 58).
; PLAN: r0=141(x1), r1=115(y1), r2=3(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 115
LDI r2, 3
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
