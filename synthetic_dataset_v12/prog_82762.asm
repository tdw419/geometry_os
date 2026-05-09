; DESCRIPTION: Places a yellow line segment connecting (308, 155) to (350, 91).
; PLAN: r0=308(x1), r1=155(y1), r2=350(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 155
LDI r2, 350
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
