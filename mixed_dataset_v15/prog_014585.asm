; DESCRIPTION: Places a red line segment connecting (93, 218) to (394, 85).
; PLAN: r0=93(x1), r1=218(y1), r2=394(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 218
LDI r2, 394
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
