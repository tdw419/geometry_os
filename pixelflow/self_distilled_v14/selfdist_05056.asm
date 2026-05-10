; DESCRIPTION: Renders a blue line segment connecting (161, 190) to (155, 12).
; PLAN: r0=161(x1), r1=190(y1), r2=155(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 190
LDI r2, 155
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
