; DESCRIPTION: Renders a purple line between points (143, 4) and (24, 158).
; PLAN: r0=143(x1), r1=4(y1), r2=24(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 4
LDI r2, 24
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
