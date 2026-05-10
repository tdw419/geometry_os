; DESCRIPTION: Renders a blue line segment connecting (88, 82) to (390, 70).
; PLAN: r0=88(x1), r1=82(y1), r2=390(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 82
LDI r2, 390
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
