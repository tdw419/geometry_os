; DESCRIPTION: Places a blue line segment connecting (131, 231) to (353, 71).
; PLAN: r0=131(x1), r1=231(y1), r2=353(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 231
LDI r2, 353
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
