; DESCRIPTION: Places a purple line segment connecting (143, 208) to (221, 116).
; PLAN: r0=143(x1), r1=208(y1), r2=221(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 208
LDI r2, 221
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
