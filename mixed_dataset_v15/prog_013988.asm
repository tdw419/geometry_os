; DESCRIPTION: Renders a blue line segment connecting (308, 158) to (111, 179).
; PLAN: r0=308(x1), r1=158(y1), r2=111(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 158
LDI r2, 111
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
