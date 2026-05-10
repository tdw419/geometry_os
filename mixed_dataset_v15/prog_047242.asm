; DESCRIPTION: Places a purple line segment connecting (109, 119) to (237, 24).
; PLAN: r0=109(x1), r1=119(y1), r2=237(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 119
LDI r2, 237
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
