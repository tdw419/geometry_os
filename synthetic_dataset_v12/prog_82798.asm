; DESCRIPTION: Renders a black line between points (378, 185) and (216, 83).
; PLAN: r0=378(x1), r1=185(y1), r2=216(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 185
LDI r2, 216
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
