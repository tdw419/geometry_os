; DESCRIPTION: Places a purple line segment connecting (195, 44) to (31, 239).
; PLAN: r0=195(x1), r1=44(y1), r2=31(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 44
LDI r2, 31
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
