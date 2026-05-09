; DESCRIPTION: Places a red line segment connecting (506, 182) to (273, 17).
; PLAN: r0=506(x1), r1=182(y1), r2=273(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 182
LDI r2, 273
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
