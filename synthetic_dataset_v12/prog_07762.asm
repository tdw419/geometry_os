; DESCRIPTION: Renders a yellow line between points (442, 18) and (448, 204).
; PLAN: r0=442(x1), r1=18(y1), r2=448(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 18
LDI r2, 448
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
