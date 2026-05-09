; DESCRIPTION: Places a purple line segment connecting (134, 24) to (234, 73).
; PLAN: r0=134(x1), r1=24(y1), r2=234(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 24
LDI r2, 234
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
