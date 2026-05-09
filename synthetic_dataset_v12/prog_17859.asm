; DESCRIPTION: Renders a yellow line between points (251, 144) and (471, 140).
; PLAN: r0=251(x1), r1=144(y1), r2=471(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 144
LDI r2, 471
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
