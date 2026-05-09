; DESCRIPTION: Renders a purple line between points (78, 218) and (186, 131).
; PLAN: r0=78(x1), r1=218(y1), r2=186(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 218
LDI r2, 186
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
