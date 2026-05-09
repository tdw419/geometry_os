; DESCRIPTION: Places a yellow line segment connecting (94, 129) to (287, 156).
; PLAN: r0=94(x1), r1=129(y1), r2=287(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 129
LDI r2, 287
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
