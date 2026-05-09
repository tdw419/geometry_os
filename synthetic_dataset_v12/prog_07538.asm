; DESCRIPTION: Renders a purple line between points (229, 169) and (388, 235).
; PLAN: r0=229(x1), r1=169(y1), r2=388(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 169
LDI r2, 388
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
