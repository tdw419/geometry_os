; DESCRIPTION: Places a green line segment connecting (256, 156) to (347, 79).
; PLAN: r0=256(x1), r1=156(y1), r2=347(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 156
LDI r2, 347
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
