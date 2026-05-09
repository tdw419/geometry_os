; DESCRIPTION: Places a purple line segment connecting (148, 8) to (147, 241).
; PLAN: r0=148(x1), r1=8(y1), r2=147(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 8
LDI r2, 147
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
