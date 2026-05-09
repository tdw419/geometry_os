; DESCRIPTION: Places a purple line segment connecting (373, 106) to (131, 93).
; PLAN: r0=373(x1), r1=106(y1), r2=131(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 106
LDI r2, 131
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
