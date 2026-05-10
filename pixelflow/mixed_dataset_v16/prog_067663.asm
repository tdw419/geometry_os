; DESCRIPTION: Renders a yellow line between points (448, 142) and (454, 216).
; PLAN: r0=448(x1), r1=142(y1), r2=454(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 142
LDI r2, 454
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
