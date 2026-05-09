; DESCRIPTION: Places a yellow line segment connecting (91, 232) to (18, 185).
; PLAN: r0=91(x1), r1=232(y1), r2=18(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 232
LDI r2, 18
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
