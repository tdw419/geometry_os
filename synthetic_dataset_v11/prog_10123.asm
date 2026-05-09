; DESCRIPTION: Places a blue line segment connecting (56, 46) to (11, 129).
; PLAN: r0=56(x1), r1=46(y1), r2=11(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 46
LDI r2, 11
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
