; DESCRIPTION: Places a yellow line segment connecting (219, 227) to (47, 176).
; PLAN: r0=219(x1), r1=227(y1), r2=47(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 227
LDI r2, 47
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
