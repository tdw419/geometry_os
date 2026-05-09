; DESCRIPTION: Renders a purple line between points (229, 81) and (157, 251).
; PLAN: r0=229(x1), r1=81(y1), r2=157(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 81
LDI r2, 157
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
