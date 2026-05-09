; DESCRIPTION: Places a purple line segment connecting (333, 223) to (244, 110).
; PLAN: r0=333(x1), r1=223(y1), r2=244(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 223
LDI r2, 244
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
