; DESCRIPTION: Renders a yellow line between points (371, 51) and (448, 59).
; PLAN: r0=371(x1), r1=51(y1), r2=448(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 51
LDI r2, 448
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
