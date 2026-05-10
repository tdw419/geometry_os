; DESCRIPTION: Renders a blue line between points (73, 120) and (441, 17).
; PLAN: r0=73(x1), r1=120(y1), r2=441(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 120
LDI r2, 441
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
