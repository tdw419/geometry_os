; DESCRIPTION: Renders a blue line between points (475, 101) and (466, 237).
; PLAN: r0=475(x1), r1=101(y1), r2=466(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 101
LDI r2, 466
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
