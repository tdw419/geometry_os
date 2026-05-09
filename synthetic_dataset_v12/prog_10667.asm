; DESCRIPTION: Places a purple line segment connecting (3, 48) to (405, 145).
; PLAN: r0=3(x1), r1=48(y1), r2=405(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 48
LDI r2, 405
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
