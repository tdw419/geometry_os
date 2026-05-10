; DESCRIPTION: Places a purple line segment connecting (230, 121) to (156, 72).
; PLAN: r0=230(x1), r1=121(y1), r2=156(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 121
LDI r2, 156
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
