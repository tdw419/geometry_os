; DESCRIPTION: Places a black line segment connecting (496, 198) to (473, 94).
; PLAN: r0=496(x1), r1=198(y1), r2=473(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 198
LDI r2, 473
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
