; DESCRIPTION: Places a purple line segment connecting (136, 236) to (56, 196).
; PLAN: r0=136(x1), r1=236(y1), r2=56(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 236
LDI r2, 56
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
