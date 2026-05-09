; DESCRIPTION: Draws a purple line from (251, 37) to (190, 100).
; PLAN: r0=251(x1), r1=37(y1), r2=190(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 37
LDI r2, 190
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
