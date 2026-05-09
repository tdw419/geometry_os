; DESCRIPTION: Renders a purple line between points (368, 155) and (181, 55).
; PLAN: r0=368(x1), r1=155(y1), r2=181(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 155
LDI r2, 181
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
