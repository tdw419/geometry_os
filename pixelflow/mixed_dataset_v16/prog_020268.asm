; DESCRIPTION: Places a purple line segment connecting (80, 118) to (152, 89).
; PLAN: r0=80(x1), r1=118(y1), r2=152(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 118
LDI r2, 152
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
