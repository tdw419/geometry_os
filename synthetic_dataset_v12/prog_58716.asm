; DESCRIPTION: Renders a green line between points (383, 216) and (378, 112).
; PLAN: r0=383(x1), r1=216(y1), r2=378(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 216
LDI r2, 378
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
