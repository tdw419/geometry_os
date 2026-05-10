; DESCRIPTION: Renders a blue line segment connecting (250, 78) to (37, 29).
; PLAN: r0=250(x1), r1=78(y1), r2=37(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 78
LDI r2, 37
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
