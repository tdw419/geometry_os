; DESCRIPTION: Places a yellow line segment connecting (141, 49) to (218, 72).
; PLAN: r0=141(x1), r1=49(y1), r2=218(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 49
LDI r2, 218
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
