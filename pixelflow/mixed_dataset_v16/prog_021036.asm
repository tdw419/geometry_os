; DESCRIPTION: Places a purple line segment connecting (510, 15) to (459, 112).
; PLAN: r0=510(x1), r1=15(y1), r2=459(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 15
LDI r2, 459
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
