; DESCRIPTION: Renders a purple line between points (172, 220) and (193, 144).
; PLAN: r0=172(x1), r1=220(y1), r2=193(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 220
LDI r2, 193
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
