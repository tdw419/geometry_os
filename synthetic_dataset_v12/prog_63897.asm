; DESCRIPTION: Places a yellow line segment connecting (234, 95) to (353, 105).
; PLAN: r0=234(x1), r1=95(y1), r2=353(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 95
LDI r2, 353
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
