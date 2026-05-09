; DESCRIPTION: Renders a purple line between points (465, 108) and (83, 118).
; PLAN: r0=465(x1), r1=108(y1), r2=83(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 108
LDI r2, 83
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
