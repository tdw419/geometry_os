; DESCRIPTION: Places a purple line segment connecting (503, 128) to (33, 4).
; PLAN: r0=503(x1), r1=128(y1), r2=33(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 128
LDI r2, 33
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
