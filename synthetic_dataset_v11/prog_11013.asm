; DESCRIPTION: Places a yellow line segment connecting (189, 198) to (221, 200).
; PLAN: r0=189(x1), r1=198(y1), r2=221(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 198
LDI r2, 221
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
