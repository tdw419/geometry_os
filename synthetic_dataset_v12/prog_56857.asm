; DESCRIPTION: Places a purple line segment connecting (383, 127) to (283, 2).
; PLAN: r0=383(x1), r1=127(y1), r2=283(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 127
LDI r2, 283
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
