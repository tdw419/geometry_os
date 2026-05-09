; DESCRIPTION: Places a purple line segment connecting (274, 38) to (331, 250).
; PLAN: r0=274(x1), r1=38(y1), r2=331(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 38
LDI r2, 331
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
