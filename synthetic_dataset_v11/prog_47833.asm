; DESCRIPTION: Places a yellow line segment connecting (75, 182) to (47, 116).
; PLAN: r0=75(x1), r1=182(y1), r2=47(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 182
LDI r2, 47
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
