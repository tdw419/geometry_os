; DESCRIPTION: Places a purple line segment connecting (369, 178) to (419, 129).
; PLAN: r0=369(x1), r1=178(y1), r2=419(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 178
LDI r2, 419
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
