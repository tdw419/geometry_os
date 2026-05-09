; DESCRIPTION: Places a purple line segment connecting (186, 131) to (14, 5).
; PLAN: r0=186(x1), r1=131(y1), r2=14(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 131
LDI r2, 14
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
