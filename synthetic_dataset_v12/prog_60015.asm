; DESCRIPTION: Places a yellow line segment connecting (353, 189) to (484, 19).
; PLAN: r0=353(x1), r1=189(y1), r2=484(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 189
LDI r2, 484
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
