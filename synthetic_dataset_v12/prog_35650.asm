; DESCRIPTION: Places a green line segment connecting (34, 227) to (374, 94).
; PLAN: r0=34(x1), r1=227(y1), r2=374(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 227
LDI r2, 374
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
