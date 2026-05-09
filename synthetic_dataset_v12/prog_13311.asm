; DESCRIPTION: Places a yellow line segment connecting (442, 211) to (318, 162).
; PLAN: r0=442(x1), r1=211(y1), r2=318(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 211
LDI r2, 318
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
