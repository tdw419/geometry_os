; DESCRIPTION: Draws a purple line from (26, 139) to (211, 18).
; PLAN: r0=26(x1), r1=139(y1), r2=211(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 139
LDI r2, 211
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
