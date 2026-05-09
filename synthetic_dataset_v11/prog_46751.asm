; DESCRIPTION: Renders a black line between points (112, 84) and (157, 94).
; PLAN: r0=112(x1), r1=84(y1), r2=157(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 84
LDI r2, 157
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
