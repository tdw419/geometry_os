; DESCRIPTION: Renders a purple line segment connecting (115, 131) to (336, 94).
; PLAN: r0=115(x1), r1=131(y1), r2=336(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 131
LDI r2, 336
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
