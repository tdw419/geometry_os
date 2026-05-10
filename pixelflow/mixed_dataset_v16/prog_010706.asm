; DESCRIPTION: Renders a blue line between points (447, 163) and (448, 194).
; PLAN: r0=447(x1), r1=163(y1), r2=448(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 163
LDI r2, 448
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
