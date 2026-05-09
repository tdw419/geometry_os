; DESCRIPTION: Renders a blue line between points (237, 170) and (88, 237).
; PLAN: r0=237(x1), r1=170(y1), r2=88(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 170
LDI r2, 88
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
