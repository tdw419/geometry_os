; DESCRIPTION: Renders a purple line between points (129, 169) and (229, 178).
; PLAN: r0=129(x1), r1=169(y1), r2=229(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 169
LDI r2, 229
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
