; DESCRIPTION: Places a purple line segment connecting (17, 248) to (172, 8).
; PLAN: r0=17(x1), r1=248(y1), r2=172(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 248
LDI r2, 172
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
