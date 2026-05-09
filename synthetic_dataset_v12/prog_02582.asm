; DESCRIPTION: Renders a purple line between points (407, 150) and (95, 157).
; PLAN: r0=407(x1), r1=150(y1), r2=95(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 150
LDI r2, 95
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
