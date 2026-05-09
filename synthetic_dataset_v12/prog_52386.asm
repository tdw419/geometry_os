; DESCRIPTION: Places a yellow line segment connecting (160, 123) to (3, 74).
; PLAN: r0=160(x1), r1=123(y1), r2=3(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 123
LDI r2, 3
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
