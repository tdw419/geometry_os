; DESCRIPTION: Places a green line segment connecting (241, 104) to (89, 105).
; PLAN: r0=241(x1), r1=104(y1), r2=89(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 104
LDI r2, 89
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
