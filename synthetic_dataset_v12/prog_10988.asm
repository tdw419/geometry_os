; DESCRIPTION: Places a purple line segment connecting (257, 53) to (34, 119).
; PLAN: r0=257(x1), r1=53(y1), r2=34(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 53
LDI r2, 34
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
