; DESCRIPTION: Places a purple line segment connecting (167, 58) to (185, 238).
; PLAN: r0=167(x1), r1=58(y1), r2=185(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 58
LDI r2, 185
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
