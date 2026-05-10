; DESCRIPTION: Renders a blue line between points (448, 191) and (232, 59).
; PLAN: r0=448(x1), r1=191(y1), r2=232(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 191
LDI r2, 232
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
