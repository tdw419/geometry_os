; DESCRIPTION: Renders a purple line between points (363, 140) and (120, 95).
; PLAN: r0=363(x1), r1=140(y1), r2=120(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 140
LDI r2, 120
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
