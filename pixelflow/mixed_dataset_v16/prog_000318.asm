; DESCRIPTION: Places a purple line segment connecting (433, 87) to (17, 8).
; PLAN: r0=433(x1), r1=87(y1), r2=17(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 87
LDI r2, 17
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
