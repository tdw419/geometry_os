; DESCRIPTION: Places a purple line segment connecting (381, 162) to (226, 135).
; PLAN: r0=381(x1), r1=162(y1), r2=226(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 162
LDI r2, 226
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
