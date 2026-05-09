; DESCRIPTION: Places a purple line segment connecting (221, 132) to (304, 199).
; PLAN: r0=221(x1), r1=132(y1), r2=304(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 132
LDI r2, 304
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
