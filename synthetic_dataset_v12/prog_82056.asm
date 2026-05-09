; DESCRIPTION: Places a yellow line segment connecting (418, 150) to (490, 3).
; PLAN: r0=418(x1), r1=150(y1), r2=490(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 150
LDI r2, 490
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
