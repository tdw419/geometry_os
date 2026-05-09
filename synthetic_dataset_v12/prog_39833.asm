; DESCRIPTION: Renders a blue line between points (260, 123) and (177, 121).
; PLAN: r0=260(x1), r1=123(y1), r2=177(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 123
LDI r2, 177
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
