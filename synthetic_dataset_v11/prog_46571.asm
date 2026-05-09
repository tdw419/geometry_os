; DESCRIPTION: Places a red line segment connecting (192, 201) to (80, 100).
; PLAN: r0=192(x1), r1=201(y1), r2=80(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 201
LDI r2, 80
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
