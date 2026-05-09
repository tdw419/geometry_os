; DESCRIPTION: Places a purple line segment connecting (211, 10) to (236, 155).
; PLAN: r0=211(x1), r1=10(y1), r2=236(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 10
LDI r2, 236
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
