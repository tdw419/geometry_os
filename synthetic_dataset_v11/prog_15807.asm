; DESCRIPTION: Places a purple line segment connecting (151, 32) to (221, 76).
; PLAN: r0=151(x1), r1=32(y1), r2=221(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 32
LDI r2, 221
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
