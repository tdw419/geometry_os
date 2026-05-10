; DESCRIPTION: Renders a purple line between points (375, 94) and (83, 89).
; PLAN: r0=375(x1), r1=94(y1), r2=83(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 94
LDI r2, 83
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
