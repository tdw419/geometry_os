; DESCRIPTION: Places a blue line segment connecting (147, 47) to (496, 79).
; PLAN: r0=147(x1), r1=47(y1), r2=496(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 47
LDI r2, 496
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
