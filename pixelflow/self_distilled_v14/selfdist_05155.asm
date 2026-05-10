; DESCRIPTION: Renders a purple line segment connecting (109, 182) to (302, 70).
; PLAN: r0=109(x1), r1=182(y1), r2=302(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 182
LDI r2, 302
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
