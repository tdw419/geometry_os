; DESCRIPTION: Places a yellow line segment connecting (347, 40) to (222, 195).
; PLAN: r0=347(x1), r1=40(y1), r2=222(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 40
LDI r2, 222
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
