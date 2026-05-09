; DESCRIPTION: Places a purple line segment connecting (195, 248) to (22, 243).
; PLAN: r0=195(x1), r1=248(y1), r2=22(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 248
LDI r2, 22
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
