; DESCRIPTION: Places a white line segment connecting (102, 4) to (347, 140).
; PLAN: r0=102(x1), r1=4(y1), r2=347(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 4
LDI r2, 347
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
