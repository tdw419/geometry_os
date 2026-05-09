; DESCRIPTION: Renders a purple line between points (156, 95) and (282, 251).
; PLAN: r0=156(x1), r1=95(y1), r2=282(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 95
LDI r2, 282
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
