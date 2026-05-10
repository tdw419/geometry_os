; DESCRIPTION: Places a yellow line segment connecting (110, 119) to (324, 74).
; PLAN: r0=110(x1), r1=119(y1), r2=324(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 119
LDI r2, 324
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
