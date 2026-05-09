; DESCRIPTION: Places a blue line segment connecting (106, 155) to (90, 94).
; PLAN: r0=106(x1), r1=155(y1), r2=90(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 155
LDI r2, 90
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
