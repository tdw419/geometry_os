; DESCRIPTION: Places a red line segment connecting (61, 137) to (133, 80).
; PLAN: r0=61(x1), r1=137(y1), r2=133(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 137
LDI r2, 133
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
