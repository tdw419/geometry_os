; DESCRIPTION: Places a purple line segment connecting (498, 113) to (431, 26).
; PLAN: r0=498(x1), r1=113(y1), r2=431(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 113
LDI r2, 431
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
