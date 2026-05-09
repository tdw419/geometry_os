; DESCRIPTION: Renders a purple line between points (95, 133) and (200, 75).
; PLAN: r0=95(x1), r1=133(y1), r2=200(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 133
LDI r2, 200
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
