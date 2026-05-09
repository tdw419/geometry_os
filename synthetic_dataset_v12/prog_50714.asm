; DESCRIPTION: Places a purple line segment connecting (201, 129) to (143, 247).
; PLAN: r0=201(x1), r1=129(y1), r2=143(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 129
LDI r2, 143
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
