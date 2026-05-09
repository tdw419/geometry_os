; DESCRIPTION: Renders a purple line between points (451, 190) and (418, 240).
; PLAN: r0=451(x1), r1=190(y1), r2=418(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 190
LDI r2, 418
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
