; DESCRIPTION: Places a yellow line segment connecting (402, 229) to (259, 216).
; PLAN: r0=402(x1), r1=229(y1), r2=259(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 229
LDI r2, 259
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
