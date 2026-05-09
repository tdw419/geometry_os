; DESCRIPTION: Renders a black line between points (137, 84) and (36, 93).
; PLAN: r0=137(x1), r1=84(y1), r2=36(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 84
LDI r2, 36
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
