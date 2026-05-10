; DESCRIPTION: Places a yellow line segment connecting (84, 115) to (78, 37).
; PLAN: r0=84(x1), r1=115(y1), r2=78(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 115
LDI r2, 78
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
