; DESCRIPTION: Renders a purple line between points (31, 230) and (89, 177).
; PLAN: r0=31(x1), r1=230(y1), r2=89(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 230
LDI r2, 89
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
