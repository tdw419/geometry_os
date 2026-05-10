; DESCRIPTION: Places a purple line segment connecting (347, 38) to (247, 38).
; PLAN: r0=347(x1), r1=38(y1), r2=247(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 38
LDI r2, 247
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
