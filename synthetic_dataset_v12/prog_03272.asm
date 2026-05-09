; DESCRIPTION: Places a purple line segment connecting (505, 109) to (414, 45).
; PLAN: r0=505(x1), r1=109(y1), r2=414(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 109
LDI r2, 414
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
