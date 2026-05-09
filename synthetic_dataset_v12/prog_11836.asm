; DESCRIPTION: Renders a blue line between points (414, 199) and (121, 14).
; PLAN: r0=414(x1), r1=199(y1), r2=121(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 199
LDI r2, 121
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
