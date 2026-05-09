; DESCRIPTION: Places a purple line segment connecting (94, 14) to (323, 95).
; PLAN: r0=94(x1), r1=14(y1), r2=323(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 14
LDI r2, 323
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
