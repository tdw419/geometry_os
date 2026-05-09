; DESCRIPTION: Places a black line segment connecting (390, 26) to (237, 73).
; PLAN: r0=390(x1), r1=26(y1), r2=237(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 26
LDI r2, 237
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
