; DESCRIPTION: Renders a purple line between points (131, 192) and (247, 66).
; PLAN: r0=131(x1), r1=192(y1), r2=247(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 192
LDI r2, 247
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
