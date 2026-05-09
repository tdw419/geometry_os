; DESCRIPTION: Places a purple line segment connecting (315, 112) to (303, 118).
; PLAN: r0=315(x1), r1=112(y1), r2=303(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 112
LDI r2, 303
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
