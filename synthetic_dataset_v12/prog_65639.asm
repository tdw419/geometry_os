; DESCRIPTION: Renders a purple line between points (258, 219) and (94, 139).
; PLAN: r0=258(x1), r1=219(y1), r2=94(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 219
LDI r2, 94
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
