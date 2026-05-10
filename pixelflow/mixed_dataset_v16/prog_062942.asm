; DESCRIPTION: Renders a blue line between points (161, 147) and (194, 189).
; PLAN: r0=161(x1), r1=147(y1), r2=194(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 147
LDI r2, 194
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
