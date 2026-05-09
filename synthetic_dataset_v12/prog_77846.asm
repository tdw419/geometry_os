; DESCRIPTION: Places a yellow line segment connecting (390, 249) to (341, 8).
; PLAN: r0=390(x1), r1=249(y1), r2=341(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 249
LDI r2, 341
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
