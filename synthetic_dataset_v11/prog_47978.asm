; DESCRIPTION: Renders a purple line between points (85, 2) and (94, 121).
; PLAN: r0=85(x1), r1=2(y1), r2=94(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 2
LDI r2, 94
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
