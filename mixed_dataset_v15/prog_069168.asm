; DESCRIPTION: Places a yellow line segment connecting (364, 204) to (232, 3).
; PLAN: r0=364(x1), r1=204(y1), r2=232(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 204
LDI r2, 232
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
