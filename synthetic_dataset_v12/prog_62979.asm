; DESCRIPTION: Renders a purple line between points (363, 118) and (48, 86).
; PLAN: r0=363(x1), r1=118(y1), r2=48(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 118
LDI r2, 48
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
