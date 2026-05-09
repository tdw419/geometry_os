; DESCRIPTION: Places a purple line segment connecting (94, 191) to (307, 89).
; PLAN: r0=94(x1), r1=191(y1), r2=307(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 191
LDI r2, 307
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
