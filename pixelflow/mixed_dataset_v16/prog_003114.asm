; DESCRIPTION: Renders a purple line segment connecting (210, 102) to (95, 45).
; PLAN: r0=210(x1), r1=102(y1), r2=95(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 102
LDI r2, 95
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
