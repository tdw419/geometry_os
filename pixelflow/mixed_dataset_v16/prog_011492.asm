; DESCRIPTION: Renders a purple line between points (92, 60) and (124, 12).
; PLAN: r0=92(x1), r1=60(y1), r2=124(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 60
LDI r2, 124
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
