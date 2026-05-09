; DESCRIPTION: Places a purple line segment connecting (234, 12) to (93, 199).
; PLAN: r0=234(x1), r1=12(y1), r2=93(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 12
LDI r2, 93
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
