; DESCRIPTION: Renders a purple line between points (363, 198) and (193, 172).
; PLAN: r0=363(x1), r1=198(y1), r2=193(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 198
LDI r2, 193
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
