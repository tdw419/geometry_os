; DESCRIPTION: Places a green line segment connecting (127, 2) to (155, 90).
; PLAN: r0=127(x1), r1=2(y1), r2=155(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 2
LDI r2, 155
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
