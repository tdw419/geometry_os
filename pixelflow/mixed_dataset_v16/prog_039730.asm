; DESCRIPTION: Renders a purple line between points (378, 186) and (199, 33).
; PLAN: r0=378(x1), r1=186(y1), r2=199(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 186
LDI r2, 199
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
