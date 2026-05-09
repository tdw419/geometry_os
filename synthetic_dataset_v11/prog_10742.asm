; DESCRIPTION: Places a green line segment connecting (163, 165) to (132, 21).
; PLAN: r0=163(x1), r1=165(y1), r2=132(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 165
LDI r2, 132
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
