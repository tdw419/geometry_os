; DESCRIPTION: Places a green line segment connecting (347, 9) to (342, 86).
; PLAN: r0=347(x1), r1=9(y1), r2=342(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 9
LDI r2, 342
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
