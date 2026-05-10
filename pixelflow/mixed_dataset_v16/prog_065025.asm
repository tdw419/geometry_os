; DESCRIPTION: Places a purple line segment connecting (93, 76) to (335, 218).
; PLAN: r0=93(x1), r1=76(y1), r2=335(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 76
LDI r2, 335
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
