; DESCRIPTION: Renders a blue line between points (378, 110) and (8, 179).
; PLAN: r0=378(x1), r1=110(y1), r2=8(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 110
LDI r2, 8
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
