; DESCRIPTION: Places a purple line segment connecting (259, 56) to (243, 47).
; PLAN: r0=259(x1), r1=56(y1), r2=243(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 56
LDI r2, 243
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
