; DESCRIPTION: Renders a yellow line between points (464, 37) and (448, 200).
; PLAN: r0=464(x1), r1=37(y1), r2=448(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 37
LDI r2, 448
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
