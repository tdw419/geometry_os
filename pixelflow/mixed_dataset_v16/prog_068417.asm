; DESCRIPTION: Renders a purple line between points (43, 136) and (179, 21).
; PLAN: r0=43(x1), r1=136(y1), r2=179(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 136
LDI r2, 179
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
