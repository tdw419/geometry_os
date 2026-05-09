; DESCRIPTION: Places a purple line segment connecting (315, 202) to (85, 114).
; PLAN: r0=315(x1), r1=202(y1), r2=85(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 202
LDI r2, 85
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
