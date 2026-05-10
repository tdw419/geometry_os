; DESCRIPTION: Places a red line segment connecting (77, 101) to (321, 93).
; PLAN: r0=77(x1), r1=101(y1), r2=321(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 101
LDI r2, 321
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
