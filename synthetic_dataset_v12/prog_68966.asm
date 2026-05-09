; DESCRIPTION: Places a red line segment connecting (245, 37) to (347, 23).
; PLAN: r0=245(x1), r1=37(y1), r2=347(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 37
LDI r2, 347
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
