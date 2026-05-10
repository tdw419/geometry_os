; DESCRIPTION: Renders a blue line segment connecting (358, 198) to (77, 161).
; PLAN: r0=358(x1), r1=198(y1), r2=77(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 198
LDI r2, 77
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
