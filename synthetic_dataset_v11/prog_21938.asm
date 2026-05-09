; DESCRIPTION: Places a purple line segment connecting (156, 43) to (84, 0).
; PLAN: r0=156(x1), r1=43(y1), r2=84(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 43
LDI r2, 84
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
