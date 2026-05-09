; DESCRIPTION: Places a purple line segment connecting (23, 128) to (191, 237).
; PLAN: r0=23(x1), r1=128(y1), r2=191(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 128
LDI r2, 191
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
