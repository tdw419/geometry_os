; DESCRIPTION: Places a purple line segment connecting (234, 86) to (313, 254).
; PLAN: r0=234(x1), r1=86(y1), r2=313(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 86
LDI r2, 313
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
