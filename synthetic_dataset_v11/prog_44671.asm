; DESCRIPTION: Renders a purple line between points (26, 119) and (150, 253).
; PLAN: r0=26(x1), r1=119(y1), r2=150(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 119
LDI r2, 150
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
