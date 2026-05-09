; DESCRIPTION: Places a black line segment connecting (339, 25) to (204, 211).
; PLAN: r0=339(x1), r1=25(y1), r2=204(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 25
LDI r2, 204
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
