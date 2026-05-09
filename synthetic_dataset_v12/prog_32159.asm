; DESCRIPTION: Places a blue line segment connecting (34, 199) to (83, 167).
; PLAN: r0=34(x1), r1=199(y1), r2=83(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 199
LDI r2, 83
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
