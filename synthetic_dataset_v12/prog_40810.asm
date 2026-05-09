; DESCRIPTION: Places a red line segment connecting (439, 198) to (463, 130).
; PLAN: r0=439(x1), r1=198(y1), r2=463(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 198
LDI r2, 463
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
