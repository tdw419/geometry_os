; DESCRIPTION: Renders a black line between points (471, 215) and (448, 17).
; PLAN: r0=471(x1), r1=215(y1), r2=448(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 215
LDI r2, 448
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
