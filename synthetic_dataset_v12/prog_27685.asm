; DESCRIPTION: Places a yellow line segment connecting (239, 216) to (254, 1).
; PLAN: r0=239(x1), r1=216(y1), r2=254(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 216
LDI r2, 254
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
