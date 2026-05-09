; DESCRIPTION: Places a yellow line segment connecting (232, 28) to (350, 254).
; PLAN: r0=232(x1), r1=28(y1), r2=350(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 28
LDI r2, 350
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
