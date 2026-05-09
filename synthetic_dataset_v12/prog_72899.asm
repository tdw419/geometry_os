; DESCRIPTION: Places a blue line segment connecting (204, 156) to (424, 18).
; PLAN: r0=204(x1), r1=156(y1), r2=424(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 156
LDI r2, 424
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
