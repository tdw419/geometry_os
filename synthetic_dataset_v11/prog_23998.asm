; DESCRIPTION: Places a yellow line segment connecting (24, 26) to (84, 94).
; PLAN: r0=24(x1), r1=26(y1), r2=84(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 26
LDI r2, 84
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
