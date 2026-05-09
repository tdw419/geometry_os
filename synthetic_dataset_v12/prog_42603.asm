; DESCRIPTION: Places a red line segment connecting (323, 182) to (7, 49).
; PLAN: r0=323(x1), r1=182(y1), r2=7(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 182
LDI r2, 7
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
