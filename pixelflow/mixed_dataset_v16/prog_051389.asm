; DESCRIPTION: Places a purple line segment connecting (503, 194) to (388, 46).
; PLAN: r0=503(x1), r1=194(y1), r2=388(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 194
LDI r2, 388
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
