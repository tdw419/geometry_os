; DESCRIPTION: Renders a purple line between points (116, 82) and (495, 201).
; PLAN: r0=116(x1), r1=82(y1), r2=495(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 82
LDI r2, 495
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
