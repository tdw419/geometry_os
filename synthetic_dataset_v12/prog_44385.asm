; DESCRIPTION: Renders a black line between points (99, 130) and (448, 254).
; PLAN: r0=99(x1), r1=130(y1), r2=448(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 130
LDI r2, 448
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
