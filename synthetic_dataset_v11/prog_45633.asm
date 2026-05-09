; DESCRIPTION: Renders a purple line between points (47, 222) and (77, 247).
; PLAN: r0=47(x1), r1=222(y1), r2=77(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 222
LDI r2, 77
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
