; DESCRIPTION: Places a purple line segment connecting (102, 72) to (137, 172).
; PLAN: r0=102(x1), r1=72(y1), r2=137(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 72
LDI r2, 137
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
