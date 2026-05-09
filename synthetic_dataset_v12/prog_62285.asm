; DESCRIPTION: Places a red line segment connecting (248, 57) to (318, 140).
; PLAN: r0=248(x1), r1=57(y1), r2=318(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 57
LDI r2, 318
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
