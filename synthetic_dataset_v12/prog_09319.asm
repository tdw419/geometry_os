; DESCRIPTION: Renders a purple line between points (458, 3) and (211, 238).
; PLAN: r0=458(x1), r1=3(y1), r2=211(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 3
LDI r2, 211
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
