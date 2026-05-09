; DESCRIPTION: Places a purple line segment connecting (383, 121) to (79, 17).
; PLAN: r0=383(x1), r1=121(y1), r2=79(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 121
LDI r2, 79
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
