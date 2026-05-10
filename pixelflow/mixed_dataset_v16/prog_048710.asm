; DESCRIPTION: Places a yellow line segment connecting (76, 121) to (417, 23).
; PLAN: r0=76(x1), r1=121(y1), r2=417(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 121
LDI r2, 417
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
