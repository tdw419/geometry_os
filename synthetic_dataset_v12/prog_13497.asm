; DESCRIPTION: Places a black line segment connecting (347, 101) to (409, 225).
; PLAN: r0=347(x1), r1=101(y1), r2=409(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 101
LDI r2, 409
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
