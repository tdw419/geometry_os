; DESCRIPTION: Places a yellow line segment connecting (472, 34) to (244, 124).
; PLAN: r0=472(x1), r1=34(y1), r2=244(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 34
LDI r2, 244
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
