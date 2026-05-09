; DESCRIPTION: Renders a purple line between points (147, 28) and (363, 31).
; PLAN: r0=147(x1), r1=28(y1), r2=363(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 28
LDI r2, 363
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
