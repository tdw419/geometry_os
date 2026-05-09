; DESCRIPTION: Renders a purple line between points (297, 1) and (177, 91).
; PLAN: r0=297(x1), r1=1(y1), r2=177(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 1
LDI r2, 177
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
