; DESCRIPTION: Places a purple line segment connecting (254, 190) to (237, 183).
; PLAN: r0=254(x1), r1=190(y1), r2=237(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 190
LDI r2, 237
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
