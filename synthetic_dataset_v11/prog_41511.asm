; DESCRIPTION: Places a purple line segment connecting (179, 159) to (93, 221).
; PLAN: r0=179(x1), r1=159(y1), r2=93(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 159
LDI r2, 93
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
