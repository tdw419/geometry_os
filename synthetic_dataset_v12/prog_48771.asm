; DESCRIPTION: Places a red line segment connecting (63, 99) to (155, 80).
; PLAN: r0=63(x1), r1=99(y1), r2=155(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 99
LDI r2, 155
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
