; DESCRIPTION: Renders a purple line between points (147, 79) and (161, 137).
; PLAN: r0=147(x1), r1=79(y1), r2=161(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 79
LDI r2, 161
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
