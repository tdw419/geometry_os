; DESCRIPTION: Renders a black line between points (219, 94) and (194, 124).
; PLAN: r0=219(x1), r1=94(y1), r2=194(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 94
LDI r2, 194
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
