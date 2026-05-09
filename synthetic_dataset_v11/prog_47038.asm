; DESCRIPTION: Renders a purple line between points (77, 90) and (95, 52).
; PLAN: r0=77(x1), r1=90(y1), r2=95(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 90
LDI r2, 95
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
