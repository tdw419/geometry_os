; DESCRIPTION: Places a yellow line segment connecting (285, 127) to (296, 147).
; PLAN: r0=285(x1), r1=127(y1), r2=296(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 127
LDI r2, 296
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
