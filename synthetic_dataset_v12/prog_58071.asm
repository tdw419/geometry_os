; DESCRIPTION: Places a purple line segment connecting (408, 201) to (372, 168).
; PLAN: r0=408(x1), r1=201(y1), r2=372(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 201
LDI r2, 372
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
