; DESCRIPTION: Renders a purple line between points (382, 190) and (510, 162).
; PLAN: r0=382(x1), r1=190(y1), r2=510(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 190
LDI r2, 510
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
