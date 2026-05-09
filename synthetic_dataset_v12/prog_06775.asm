; DESCRIPTION: Places a green line segment connecting (347, 54) to (23, 191).
; PLAN: r0=347(x1), r1=54(y1), r2=23(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 54
LDI r2, 23
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
