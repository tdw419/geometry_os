; DESCRIPTION: Places a purple line segment connecting (328, 191) to (22, 106).
; PLAN: r0=328(x1), r1=191(y1), r2=22(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 191
LDI r2, 22
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
