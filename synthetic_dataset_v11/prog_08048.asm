; DESCRIPTION: Places a yellow line segment connecting (254, 10) to (117, 216).
; PLAN: r0=254(x1), r1=10(y1), r2=117(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 10
LDI r2, 117
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
