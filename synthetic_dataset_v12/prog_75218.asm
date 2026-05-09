; DESCRIPTION: Places a purple line segment connecting (305, 83) to (56, 238).
; PLAN: r0=305(x1), r1=83(y1), r2=56(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 83
LDI r2, 56
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
