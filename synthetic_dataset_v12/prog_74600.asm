; DESCRIPTION: Places a purple line segment connecting (160, 136) to (302, 247).
; PLAN: r0=160(x1), r1=136(y1), r2=302(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 136
LDI r2, 302
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
