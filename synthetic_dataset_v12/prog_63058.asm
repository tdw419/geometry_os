; DESCRIPTION: Places a blue line segment connecting (118, 220) to (336, 89).
; PLAN: r0=118(x1), r1=220(y1), r2=336(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 220
LDI r2, 336
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
