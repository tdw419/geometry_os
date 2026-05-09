; DESCRIPTION: Renders a purple line between points (356, 147) and (416, 109).
; PLAN: r0=356(x1), r1=147(y1), r2=416(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 147
LDI r2, 416
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
