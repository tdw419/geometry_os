; DESCRIPTION: Places a yellow line segment connecting (385, 162) to (291, 97).
; PLAN: r0=385(x1), r1=162(y1), r2=291(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 162
LDI r2, 291
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
