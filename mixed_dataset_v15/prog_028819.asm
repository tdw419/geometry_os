; DESCRIPTION: Places a red line segment connecting (186, 137) to (355, 23).
; PLAN: r0=186(x1), r1=137(y1), r2=355(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 137
LDI r2, 355
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
