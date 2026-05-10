; DESCRIPTION: Places a purple line segment connecting (97, 90) to (79, 250).
; PLAN: r0=97(x1), r1=90(y1), r2=79(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 90
LDI r2, 79
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
