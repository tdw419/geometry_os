; DESCRIPTION: Renders a purple line between points (12, 78) and (451, 190).
; PLAN: r0=12(x1), r1=78(y1), r2=451(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 78
LDI r2, 451
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
