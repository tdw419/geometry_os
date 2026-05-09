; DESCRIPTION: Places a blue line segment connecting (466, 141) to (317, 21).
; PLAN: r0=466(x1), r1=141(y1), r2=317(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 141
LDI r2, 317
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
