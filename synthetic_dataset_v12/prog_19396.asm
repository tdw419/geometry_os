; DESCRIPTION: Places a purple line segment connecting (236, 236) to (254, 138).
; PLAN: r0=236(x1), r1=236(y1), r2=254(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 236
LDI r2, 254
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
