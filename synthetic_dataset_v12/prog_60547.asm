; DESCRIPTION: Renders a purple line between points (395, 87) and (388, 12).
; PLAN: r0=395(x1), r1=87(y1), r2=388(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 87
LDI r2, 388
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
