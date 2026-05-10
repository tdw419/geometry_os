; DESCRIPTION: Places a purple line segment connecting (496, 142) to (277, 245).
; PLAN: r0=496(x1), r1=142(y1), r2=277(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 142
LDI r2, 277
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
