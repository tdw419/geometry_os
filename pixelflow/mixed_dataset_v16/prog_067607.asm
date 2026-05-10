; DESCRIPTION: Renders a purple line segment connecting (164, 169) to (260, 145).
; PLAN: r0=164(x1), r1=169(y1), r2=260(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 169
LDI r2, 260
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
