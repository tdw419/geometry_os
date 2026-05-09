; DESCRIPTION: Places a purple line segment connecting (418, 131) to (365, 59).
; PLAN: r0=418(x1), r1=131(y1), r2=365(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 131
LDI r2, 365
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
