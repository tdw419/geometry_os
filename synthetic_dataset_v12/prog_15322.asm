; DESCRIPTION: Places a red line segment connecting (483, 58) to (347, 229).
; PLAN: r0=483(x1), r1=58(y1), r2=347(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 58
LDI r2, 347
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
