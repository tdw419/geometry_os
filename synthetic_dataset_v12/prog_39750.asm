; DESCRIPTION: Places a blue line segment connecting (98, 182) to (422, 218).
; PLAN: r0=98(x1), r1=182(y1), r2=422(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 182
LDI r2, 422
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
