; DESCRIPTION: Places a purple line segment connecting (250, 174) to (454, 26).
; PLAN: r0=250(x1), r1=174(y1), r2=454(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 174
LDI r2, 454
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
