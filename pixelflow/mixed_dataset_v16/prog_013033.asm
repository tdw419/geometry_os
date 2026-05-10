; DESCRIPTION: Renders a black line between points (471, 11) and (255, 185).
; PLAN: r0=471(x1), r1=11(y1), r2=255(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 11
LDI r2, 255
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
