; DESCRIPTION: Places a purple line segment connecting (223, 119) to (114, 167).
; PLAN: r0=223(x1), r1=119(y1), r2=114(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 119
LDI r2, 114
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
