; DESCRIPTION: Places a yellow line segment connecting (457, 217) to (238, 219).
; PLAN: r0=457(x1), r1=217(y1), r2=238(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 217
LDI r2, 238
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
