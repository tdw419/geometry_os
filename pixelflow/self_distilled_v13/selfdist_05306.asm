; DESCRIPTION: Renders a blue line segment connecting (135, 186) to (389, 163).
; PLAN: r0=135(x1), r1=186(y1), r2=389(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 186
LDI r2, 389
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
