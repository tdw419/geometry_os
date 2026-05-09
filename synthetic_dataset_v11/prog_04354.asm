; DESCRIPTION: Places a purple line segment connecting (97, 153) to (198, 90).
; PLAN: r0=97(x1), r1=153(y1), r2=198(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 153
LDI r2, 198
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
