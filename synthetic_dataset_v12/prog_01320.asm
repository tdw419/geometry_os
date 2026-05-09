; DESCRIPTION: Places a yellow line segment connecting (132, 84) to (411, 17).
; PLAN: r0=132(x1), r1=84(y1), r2=411(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 84
LDI r2, 411
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
