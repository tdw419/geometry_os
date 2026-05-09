; DESCRIPTION: Renders a blue line between points (148, 142) and (46, 147).
; PLAN: r0=148(x1), r1=142(y1), r2=46(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 142
LDI r2, 46
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
