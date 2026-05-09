; DESCRIPTION: Places a orange line segment connecting (189, 144) to (347, 207).
; PLAN: r0=189(x1), r1=144(y1), r2=347(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 144
LDI r2, 347
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
