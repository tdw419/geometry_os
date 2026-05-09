; DESCRIPTION: Renders a purple line between points (379, 14) and (389, 121).
; PLAN: r0=379(x1), r1=14(y1), r2=389(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 14
LDI r2, 389
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
