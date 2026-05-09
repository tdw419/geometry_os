; DESCRIPTION: Places a yellow line segment connecting (323, 118) to (185, 31).
; PLAN: r0=323(x1), r1=118(y1), r2=185(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 118
LDI r2, 185
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
