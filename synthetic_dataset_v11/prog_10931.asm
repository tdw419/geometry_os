; DESCRIPTION: Places a blue line segment connecting (208, 223) to (62, 39).
; PLAN: r0=208(x1), r1=223(y1), r2=62(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 223
LDI r2, 62
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
