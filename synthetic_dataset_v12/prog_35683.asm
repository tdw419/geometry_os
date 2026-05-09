; DESCRIPTION: Places a purple line segment connecting (317, 191) to (466, 32).
; PLAN: r0=317(x1), r1=191(y1), r2=466(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 191
LDI r2, 466
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
