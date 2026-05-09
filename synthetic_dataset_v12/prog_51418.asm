; DESCRIPTION: Places a purple line segment connecting (234, 134) to (353, 32).
; PLAN: r0=234(x1), r1=134(y1), r2=353(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 134
LDI r2, 353
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
