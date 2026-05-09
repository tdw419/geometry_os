; DESCRIPTION: Places a purple line segment connecting (36, 167) to (81, 89).
; PLAN: r0=36(x1), r1=167(y1), r2=81(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 167
LDI r2, 81
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
