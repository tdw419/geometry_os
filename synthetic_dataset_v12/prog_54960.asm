; DESCRIPTION: Renders a purple line between points (116, 182) and (251, 35).
; PLAN: r0=116(x1), r1=182(y1), r2=251(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 182
LDI r2, 251
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
