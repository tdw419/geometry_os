; DESCRIPTION: Places a purple line segment connecting (391, 71) to (297, 78).
; PLAN: r0=391(x1), r1=71(y1), r2=297(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 71
LDI r2, 297
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
