; DESCRIPTION: Places a black line segment connecting (418, 97) to (78, 184).
; PLAN: r0=418(x1), r1=97(y1), r2=78(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 97
LDI r2, 78
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
