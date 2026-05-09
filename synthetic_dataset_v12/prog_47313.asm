; DESCRIPTION: Renders a blue line between points (484, 193) and (123, 147).
; PLAN: r0=484(x1), r1=193(y1), r2=123(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 193
LDI r2, 123
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
