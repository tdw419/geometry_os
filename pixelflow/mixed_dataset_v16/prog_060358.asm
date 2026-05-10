; DESCRIPTION: Places a red line segment connecting (91, 201) to (22, 12).
; PLAN: r0=91(x1), r1=201(y1), r2=22(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 201
LDI r2, 22
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
