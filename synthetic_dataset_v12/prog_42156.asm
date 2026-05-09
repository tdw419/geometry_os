; DESCRIPTION: Renders a purple line between points (366, 6) and (441, 74).
; PLAN: r0=366(x1), r1=6(y1), r2=441(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 6
LDI r2, 441
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
