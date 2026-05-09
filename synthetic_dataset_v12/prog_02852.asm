; DESCRIPTION: Places a yellow line segment connecting (418, 192) to (366, 251).
; PLAN: r0=418(x1), r1=192(y1), r2=366(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 192
LDI r2, 366
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
