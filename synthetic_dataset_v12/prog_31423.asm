; DESCRIPTION: Renders a blue line between points (177, 87) and (451, 112).
; PLAN: r0=177(x1), r1=87(y1), r2=451(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 87
LDI r2, 451
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
