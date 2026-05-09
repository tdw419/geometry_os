; DESCRIPTION: Places a purple line segment connecting (326, 189) to (153, 48).
; PLAN: r0=326(x1), r1=189(y1), r2=153(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 189
LDI r2, 153
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
