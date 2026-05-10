; DESCRIPTION: Draws a yellow line from (89, 185) to (378, 139).
; PLAN: r0=89(x1), r1=185(y1), r2=378(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 185
LDI r2, 378
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
