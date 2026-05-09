; DESCRIPTION: Places a blue line segment connecting (288, 170) to (319, 100).
; PLAN: r0=288(x1), r1=170(y1), r2=319(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 170
LDI r2, 319
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
