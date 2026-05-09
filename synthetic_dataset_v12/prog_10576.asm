; DESCRIPTION: Renders a purple line between points (223, 223) and (323, 145).
; PLAN: r0=223(x1), r1=223(y1), r2=323(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 223
LDI r2, 323
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
