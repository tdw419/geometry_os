; DESCRIPTION: Places a blue line segment connecting (347, 201) to (394, 56).
; PLAN: r0=347(x1), r1=201(y1), r2=394(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 201
LDI r2, 394
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
