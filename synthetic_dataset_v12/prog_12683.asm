; DESCRIPTION: Draws a purple line from (141, 8) to (378, 18).
; PLAN: r0=141(x1), r1=8(y1), r2=378(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 8
LDI r2, 378
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
