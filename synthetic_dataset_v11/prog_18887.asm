; DESCRIPTION: Places a blue line segment connecting (169, 98) to (250, 126).
; PLAN: r0=169(x1), r1=98(y1), r2=250(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 98
LDI r2, 250
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
