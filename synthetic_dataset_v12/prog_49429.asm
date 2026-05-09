; DESCRIPTION: Places a purple line segment connecting (343, 104) to (510, 118).
; PLAN: r0=343(x1), r1=104(y1), r2=510(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 104
LDI r2, 510
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
