; DESCRIPTION: Places a purple line segment connecting (201, 226) to (220, 248).
; PLAN: r0=201(x1), r1=226(y1), r2=220(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 226
LDI r2, 220
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
