; DESCRIPTION: Places a purple line segment connecting (11, 8) to (237, 45).
; PLAN: r0=11(x1), r1=8(y1), r2=237(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 8
LDI r2, 237
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
