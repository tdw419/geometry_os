; DESCRIPTION: Renders a yellow line segment connecting (381, 119) to (94, 23).
; PLAN: r0=381(x1), r1=119(y1), r2=94(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 119
LDI r2, 94
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
