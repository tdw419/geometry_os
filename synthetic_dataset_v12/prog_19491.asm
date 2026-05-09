; DESCRIPTION: Places a black line segment connecting (349, 94) to (496, 8).
; PLAN: r0=349(x1), r1=94(y1), r2=496(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 94
LDI r2, 496
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
