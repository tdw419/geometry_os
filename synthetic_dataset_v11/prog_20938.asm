; DESCRIPTION: Renders a purple line between points (160, 247) and (89, 59).
; PLAN: r0=160(x1), r1=247(y1), r2=89(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 247
LDI r2, 89
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
