; DESCRIPTION: Renders a black line between points (411, 219) and (448, 28).
; PLAN: r0=411(x1), r1=219(y1), r2=448(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 219
LDI r2, 448
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
