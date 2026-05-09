; DESCRIPTION: Renders a purple line between points (388, 247) and (260, 90).
; PLAN: r0=388(x1), r1=247(y1), r2=260(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 247
LDI r2, 260
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
