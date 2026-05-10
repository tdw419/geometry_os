; DESCRIPTION: Places a blue line segment connecting (65, 61) to (389, 159).
; PLAN: r0=65(x1), r1=61(y1), r2=389(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 61
LDI r2, 389
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
