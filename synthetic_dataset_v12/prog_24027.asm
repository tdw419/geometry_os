; DESCRIPTION: Places a purple line segment connecting (454, 28) to (415, 218).
; PLAN: r0=454(x1), r1=28(y1), r2=415(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 28
LDI r2, 415
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
