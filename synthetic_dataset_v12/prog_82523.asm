; DESCRIPTION: Places a blue line segment connecting (250, 126) to (395, 148).
; PLAN: r0=250(x1), r1=126(y1), r2=395(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 126
LDI r2, 395
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
