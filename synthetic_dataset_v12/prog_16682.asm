; DESCRIPTION: Renders a blue line between points (448, 94) and (131, 238).
; PLAN: r0=448(x1), r1=94(y1), r2=131(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 94
LDI r2, 131
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
