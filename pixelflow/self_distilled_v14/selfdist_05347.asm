; DESCRIPTION: Renders a blue line segment connecting (225, 147) to (105, 168).
; PLAN: r0=225(x1), r1=147(y1), r2=105(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 147
LDI r2, 105
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
