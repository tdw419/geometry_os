; DESCRIPTION: Places a purple line segment connecting (132, 226) to (422, 15).
; PLAN: r0=132(x1), r1=226(y1), r2=422(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 226
LDI r2, 422
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
