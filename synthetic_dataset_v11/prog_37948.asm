; DESCRIPTION: Places a purple line segment connecting (190, 131) to (79, 109).
; PLAN: r0=190(x1), r1=131(y1), r2=79(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 131
LDI r2, 79
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
