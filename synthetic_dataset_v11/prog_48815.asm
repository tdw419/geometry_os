; DESCRIPTION: Places a purple line segment connecting (62, 250) to (247, 138).
; PLAN: r0=62(x1), r1=250(y1), r2=247(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 250
LDI r2, 247
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
