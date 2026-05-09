; DESCRIPTION: Renders a purple line between points (92, 21) and (216, 144).
; PLAN: r0=92(x1), r1=21(y1), r2=216(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 21
LDI r2, 216
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
