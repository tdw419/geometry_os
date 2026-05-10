; DESCRIPTION: Places a purple line segment connecting (104, 131) to (383, 152).
; PLAN: r0=104(x1), r1=131(y1), r2=383(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 131
LDI r2, 383
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
