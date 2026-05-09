; DESCRIPTION: Renders a purple line between points (312, 133) and (500, 45).
; PLAN: r0=312(x1), r1=133(y1), r2=500(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 133
LDI r2, 500
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
