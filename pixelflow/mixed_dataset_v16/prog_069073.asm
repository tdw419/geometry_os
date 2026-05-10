; DESCRIPTION: Renders a purple line between points (313, 124) and (169, 13).
; PLAN: r0=313(x1), r1=124(y1), r2=169(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 124
LDI r2, 169
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
