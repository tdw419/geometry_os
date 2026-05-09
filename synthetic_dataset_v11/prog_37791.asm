; DESCRIPTION: Places a purple line segment connecting (170, 255) to (250, 101).
; PLAN: r0=170(x1), r1=255(y1), r2=250(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 255
LDI r2, 250
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
