; DESCRIPTION: Places a green line segment connecting (219, 119) to (226, 58).
; PLAN: r0=219(x1), r1=119(y1), r2=226(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 119
LDI r2, 226
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
