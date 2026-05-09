; DESCRIPTION: Places a green line segment connecting (339, 115) to (431, 11).
; PLAN: r0=339(x1), r1=115(y1), r2=431(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 115
LDI r2, 431
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
