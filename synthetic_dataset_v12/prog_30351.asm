; DESCRIPTION: Places a blue line segment connecting (141, 75) to (18, 94).
; PLAN: r0=141(x1), r1=75(y1), r2=18(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 75
LDI r2, 18
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
