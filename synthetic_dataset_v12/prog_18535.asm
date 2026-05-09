; DESCRIPTION: Places a black line segment connecting (347, 125) to (454, 229).
; PLAN: r0=347(x1), r1=125(y1), r2=454(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 125
LDI r2, 454
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
