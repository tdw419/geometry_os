; DESCRIPTION: Places a purple line segment connecting (486, 158) to (143, 40).
; PLAN: r0=486(x1), r1=158(y1), r2=143(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 158
LDI r2, 143
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
