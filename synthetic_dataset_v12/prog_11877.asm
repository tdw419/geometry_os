; DESCRIPTION: Places a purple line segment connecting (147, 24) to (237, 196).
; PLAN: r0=147(x1), r1=24(y1), r2=237(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 24
LDI r2, 237
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
