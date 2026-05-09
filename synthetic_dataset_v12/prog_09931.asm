; DESCRIPTION: Renders a blue line between points (403, 216) and (414, 65).
; PLAN: r0=403(x1), r1=216(y1), r2=414(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 216
LDI r2, 414
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
