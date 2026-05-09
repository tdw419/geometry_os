; DESCRIPTION: Places a orange line segment connecting (347, 192) to (455, 206).
; PLAN: r0=347(x1), r1=192(y1), r2=455(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 192
LDI r2, 455
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
