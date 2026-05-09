; DESCRIPTION: Places a purple line segment connecting (190, 211) to (118, 73).
; PLAN: r0=190(x1), r1=211(y1), r2=118(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 211
LDI r2, 118
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
