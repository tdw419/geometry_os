; DESCRIPTION: Places a blue line segment connecting (133, 95) to (317, 134).
; PLAN: r0=133(x1), r1=95(y1), r2=317(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 95
LDI r2, 317
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
