; DESCRIPTION: Renders a purple line between points (363, 229) and (75, 20).
; PLAN: r0=363(x1), r1=229(y1), r2=75(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 229
LDI r2, 75
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
