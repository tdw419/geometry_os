; DESCRIPTION: Places a purple line segment connecting (326, 237) to (468, 206).
; PLAN: r0=326(x1), r1=237(y1), r2=468(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 237
LDI r2, 468
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
