; DESCRIPTION: Renders a purple line between points (353, 124) and (164, 35).
; PLAN: r0=353(x1), r1=124(y1), r2=164(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 124
LDI r2, 164
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
