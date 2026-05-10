; DESCRIPTION: Renders a blue line between points (123, 148) and (322, 54).
; PLAN: r0=123(x1), r1=148(y1), r2=322(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 148
LDI r2, 322
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
