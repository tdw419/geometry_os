; DESCRIPTION: Renders a blue line between points (296, 250) and (458, 85).
; PLAN: r0=296(x1), r1=250(y1), r2=458(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 250
LDI r2, 458
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
