; DESCRIPTION: Places a purple line segment connecting (323, 116) to (360, 89).
; PLAN: r0=323(x1), r1=116(y1), r2=360(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 116
LDI r2, 360
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
