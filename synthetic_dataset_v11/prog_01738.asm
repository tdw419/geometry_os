; DESCRIPTION: Places a yellow line segment connecting (23, 137) to (98, 211).
; PLAN: r0=23(x1), r1=137(y1), r2=98(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 137
LDI r2, 98
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
