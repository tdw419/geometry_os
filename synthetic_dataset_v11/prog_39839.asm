; DESCRIPTION: Places a yellow line segment connecting (18, 188) to (129, 2).
; PLAN: r0=18(x1), r1=188(y1), r2=129(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 188
LDI r2, 129
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
