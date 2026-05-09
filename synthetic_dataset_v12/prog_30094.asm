; DESCRIPTION: Places a blue line segment connecting (466, 0) to (212, 46).
; PLAN: r0=466(x1), r1=0(y1), r2=212(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 0
LDI r2, 212
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
