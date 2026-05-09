; DESCRIPTION: Renders a purple line between points (164, 55) and (36, 80).
; PLAN: r0=164(x1), r1=55(y1), r2=36(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 55
LDI r2, 36
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
