; DESCRIPTION: Places a purple line segment connecting (330, 107) to (218, 139).
; PLAN: r0=330(x1), r1=107(y1), r2=218(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 107
LDI r2, 218
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
