; DESCRIPTION: Draws a purple line from (29, 245) to (89, 139).
; PLAN: r0=29(x1), r1=245(y1), r2=89(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 245
LDI r2, 89
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
