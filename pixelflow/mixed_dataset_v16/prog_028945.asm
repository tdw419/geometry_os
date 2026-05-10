; DESCRIPTION: Places a yellow line segment connecting (402, 95) to (94, 110).
; PLAN: r0=402(x1), r1=95(y1), r2=94(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 95
LDI r2, 94
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
