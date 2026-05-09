; DESCRIPTION: Places a purple line segment connecting (104, 77) to (496, 31).
; PLAN: r0=104(x1), r1=77(y1), r2=496(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 77
LDI r2, 496
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
