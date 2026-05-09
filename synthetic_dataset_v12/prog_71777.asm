; DESCRIPTION: Places a green line segment connecting (471, 110) to (90, 129).
; PLAN: r0=471(x1), r1=110(y1), r2=90(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 110
LDI r2, 90
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
