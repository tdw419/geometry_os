; DESCRIPTION: Places a purple line segment connecting (128, 212) to (122, 72).
; PLAN: r0=128(x1), r1=212(y1), r2=122(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 212
LDI r2, 122
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
