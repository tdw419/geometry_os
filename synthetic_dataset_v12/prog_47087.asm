; DESCRIPTION: Renders a purple line between points (124, 150) and (151, 169).
; PLAN: r0=124(x1), r1=150(y1), r2=151(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 150
LDI r2, 151
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
