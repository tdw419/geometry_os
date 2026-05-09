; DESCRIPTION: Places a blue line segment connecting (244, 140) to (247, 47).
; PLAN: r0=244(x1), r1=140(y1), r2=247(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 140
LDI r2, 247
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
