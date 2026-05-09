; DESCRIPTION: Places a purple line segment connecting (24, 191) to (12, 48).
; PLAN: r0=24(x1), r1=191(y1), r2=12(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 191
LDI r2, 12
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
