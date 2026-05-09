; DESCRIPTION: Renders a purple line between points (245, 179) and (229, 158).
; PLAN: r0=245(x1), r1=179(y1), r2=229(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 179
LDI r2, 229
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
