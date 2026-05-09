; DESCRIPTION: Places a purple line segment connecting (333, 55) to (388, 56).
; PLAN: r0=333(x1), r1=55(y1), r2=388(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 55
LDI r2, 388
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
