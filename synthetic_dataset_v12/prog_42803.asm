; DESCRIPTION: Places a purple line segment connecting (261, 177) to (447, 139).
; PLAN: r0=261(x1), r1=177(y1), r2=447(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 177
LDI r2, 447
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
