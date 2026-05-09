; DESCRIPTION: Places a yellow line segment connecting (94, 129) to (216, 147).
; PLAN: r0=94(x1), r1=129(y1), r2=216(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 129
LDI r2, 216
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
