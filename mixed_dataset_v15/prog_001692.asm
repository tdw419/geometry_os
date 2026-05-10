; DESCRIPTION: Renders a black line between points (468, 169) and (11, 147).
; PLAN: r0=468(x1), r1=169(y1), r2=11(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 169
LDI r2, 11
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
