; DESCRIPTION: Places a purple line segment connecting (85, 48) to (419, 99).
; PLAN: r0=85(x1), r1=48(y1), r2=419(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 48
LDI r2, 419
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
