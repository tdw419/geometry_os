; DESCRIPTION: Renders a blue line between points (222, 147) and (201, 143).
; PLAN: r0=222(x1), r1=147(y1), r2=201(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 147
LDI r2, 201
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
