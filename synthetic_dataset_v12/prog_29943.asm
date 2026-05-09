; DESCRIPTION: Renders a purple line between points (10, 246) and (278, 131).
; PLAN: r0=10(x1), r1=246(y1), r2=278(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 246
LDI r2, 278
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
