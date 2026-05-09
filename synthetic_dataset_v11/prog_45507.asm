; DESCRIPTION: Places a yellow line segment connecting (147, 160) to (162, 125).
; PLAN: r0=147(x1), r1=160(y1), r2=162(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 160
LDI r2, 162
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
