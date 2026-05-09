; DESCRIPTION: Places a blue line segment connecting (302, 90) to (350, 161).
; PLAN: r0=302(x1), r1=90(y1), r2=350(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 90
LDI r2, 350
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
