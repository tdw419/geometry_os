; DESCRIPTION: Places a white line segment connecting (347, 101) to (466, 90).
; PLAN: r0=347(x1), r1=101(y1), r2=466(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 101
LDI r2, 466
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
