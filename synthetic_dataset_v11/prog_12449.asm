; DESCRIPTION: Places a red line segment connecting (163, 137) to (251, 162).
; PLAN: r0=163(x1), r1=137(y1), r2=251(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 137
LDI r2, 251
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
