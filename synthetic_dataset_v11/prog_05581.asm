; DESCRIPTION: Places a purple line segment connecting (141, 219) to (36, 143).
; PLAN: r0=141(x1), r1=219(y1), r2=36(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 219
LDI r2, 36
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
