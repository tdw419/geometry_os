; DESCRIPTION: Places a yellow line segment connecting (254, 184) to (301, 162).
; PLAN: r0=254(x1), r1=184(y1), r2=301(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 184
LDI r2, 301
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
