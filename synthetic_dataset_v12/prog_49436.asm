; DESCRIPTION: Places a red line segment connecting (101, 75) to (363, 97).
; PLAN: r0=101(x1), r1=75(y1), r2=363(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 75
LDI r2, 363
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
